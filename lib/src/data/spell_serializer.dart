class SpellSerializer {
  // Methods
  static Map<String, int> parseLevelAndGetClass(String spellLevel) {
    Map<String, int> result_map = {};

    // each "class level" is separated by a ","
    for (String classLevel in spellLevel.split(",")) {
      classLevel = classLevel.trim();

      if (classLevel.contains(" ")) {
        List<String> classAndLevel = classLevel.split(" ");

        // sometimes class name can be in two words
        String className =
            classAndLevel.sublist(0, classAndLevel.length - 1).join(" ");
        int level = int.parse(classAndLevel.last);

        // sometimes there are two classes with the same level separated by a "/"
        if (className.contains("/")) {
          List<String> classList = className.split("/");
          for (String name in classList) {
            result_map[name.trim()] = level;
          }
        } else {
          result_map[className.trim()] = level;
        }
      } else {
        result_map[classLevel.trim()] = 1;
      }
    }
    return result_map;
  }
}
