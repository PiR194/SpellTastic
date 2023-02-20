import 'dart:ffi';

class Spell {

      String name;
      String description;
      String school; // enum
     // String target;
      // String duration; // class?
      // Bool spellResistance;

      Spell(this.name, this.school, this.description);

      @override
      String toString() {
        return "name: $name \nschool: $school";
  }
}
