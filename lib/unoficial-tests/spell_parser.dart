void main() {
  String spellLevel =
      "cleric 8, druid 8, sorcerer/wizard 8, witch 8, Mystery ascetic 8";
  spellLevel = spellLevel.replaceAll(
      '\u00A0', ' '); // Replace non-breaking space with regular space

  var result = testParser(spellLevel);
  print(result);
}

Map<String, int> testParser(String spellLevel) {
  Map<String, int> result_map = {};

  /* In the scrapper's current state, some spells have other attributes
    scrapped on to their "level" string. We chose to trim this in this function
    as it was easier to debug and find those few cases. */
  spellLevel = spellLevel.replaceAll(
      RegExp(
          r'\b(?:Duration|Components|Saving\sThrow|Target|Casting|Bloodline|Mystery)\b.*'),
      '');

  // "(*) We couldn't add "(*)" cases on the first RegExp so we did it seperatly"
  spellLevel = extractLevelAndClass(spellLevel);

  // each "class level" is separated by a ","
  for (String classLevel in spellLevel.split(",")) {
    classLevel = classLevel.trim();
    print("Class level: ${classLevel}");

    if (classLevel.contains(" ")) {
      List<String> classAndLevel = classLevel.split(" ");
      print("List class&level: ${classAndLevel}");

      // sometimes class name can be in two words
      String className =
          classAndLevel.sublist(0, classAndLevel.length - 1).join(" ");
      int level = int.parse(classAndLevel.last);

      print("Class name: ${className}");

      // sometimes there are two classes with the same level separated by a "/"
      if (className.contains("/")) {
        List<String> classList = className.split("/");
        for (String name in classList) {
          result_map[name.trim()] = level;
        }
      } else {
        result_map[className.trim()] = level;
      }
    }
  }

  return result_map;
}

String extractLevelAndClass(String spellWithUnwantedString) {
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
