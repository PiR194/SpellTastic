class Spell {
  //late String _id;
  String _name;
  String _school;
  //late Map<String, int> levels;

  Spell(this._name, this._school);

  @override
  String toString() {
    return "name: $_name \nschool: $_school";
  }
}
