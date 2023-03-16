import 'package:code/src/model/CharacterClass.dart';
import 'package:code/src/model/character.dart';

class SpellSerializer {
  // Methods
  static Map<CharacterClass, int> parseLevelAndGetClass(String spellLevel) {
    Map<CharacterClass, int> result_map = {};

    /* In the scrapper's current state, some spells have other attributes
    scrapped on to their "level" string. We chose to trim this in this function
    as it was easier to debug and find those few cases. */
    spellLevel = spellLevel.replaceAll(
        RegExp(
            r'\b(?:Duration|Components|Saving\sThrow|Target|Casting|Bloodline|Mystery)\b.*'),
        '');

    // "(*) We couldn't add "(*)" cases on the first RegExp so we did it seperatly"
    spellLevel = extractLevelAndClass(spellLevel);

    // sometimes there are odd white spaces between the class and the level
    spellLevel = spellLevel.replaceAll(
        '\u00A0', ' '); // Replace non-breaking space with regular space

    // each "class level" is separated by a ","
    for (String classLevel in spellLevel.split(",")) {
      classLevel = classLevel.trim();

      if (classLevel.contains(" ") || classLevel.contains("/")) {
        List<String> classAndLevel = classLevel.split(" ");

        // sometimes class name can be in two words
        String className =
            classAndLevel.sublist(0, classAndLevel.length - 1).join(" ");
        int level = int.parse(classAndLevel.last);

        // sometimes there are two classes with the same level separated by a "/"
        if (className.contains("/")) {
          List<String> classList = className.split("/");
          for (String name in classList) {
            result_map[SpellSerializer.stringToClass(name.trim())] = level;
          }
        } else {
          result_map[SpellSerializer.stringToClass(className.trim())] = level;
        }
      }
    }
    return result_map;
  }

  static String extractLevelAndClass(String spellWithUnwantedString) {
    // Remove anything in parentheses
    String cleanString =
        spellWithUnwantedString.replaceAll(RegExp(r'\(.*\)'), '').trim();

    // if space after number
    Iterable<Match> matches = RegExp(r'\d\s').allMatches(cleanString);

    // If no matches are found then clean
    if (matches.isEmpty) {
      return cleanString;
    }

    // if not, take it up to last match (because some cases have "summoner (unchained)")
    int endIndex = matches.last.end;
    return cleanString.substring(0, endIndex);
  }

  static CharacterClass stringToClass(String character) {
    switch (character) {
      case "unchained summoner":
        {
          character = "unchainedSummoner";
        }
        break;

      case "crimson assassin":
        {
          character = "crimsonAssassin";
        }
        break;

      case "sahir-afiyun":
        {
          character = "sahirAfiyun";
        }
        break;
    }

    if (character == "") {
      print("Empty character class");
    }
    for (var value in CharacterClass.values) {
      if (value.toString().split('.').last == character) {
        return value;
      }
    }
    throw ArgumentError('Invalid character class: $character');
  }
}
