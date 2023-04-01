import 'package:collection/collection.dart';
import 'package:code/src/model/character_class.dart';

/*
* This class represents a spell.
*/

class Spell {
  // Attributes
  int _id;
  String _name;
  final Map<CharacterClass, int> _level;
  String _school;
  String _castingTime;
  String _components;
  String _range;
  String _target;
  String _area;
  String _effect;
  String _duration;
  String _savingThrow;
  String _spellResistance;
  String _description;

  // Constructor
  Spell(
      this._id,
      this._name,
      this._level,
      this._school,
      this._castingTime,
      this._components,
      this._range,
      this._target,
      this._area,
      this._effect,
      this._duration,
      this._savingThrow,
      this._spellResistance,
      this._description);

  // Getters and Setters
  int get id => _id;

  String get name => _name;
  set name(String name) => _name = name;

  String get school => _school;
  set school(String school) => _school = school;

  Map<CharacterClass, int> get level => _level;

  String get castingTime => _castingTime;
  set castingTime(String castingTime) => _castingTime = castingTime;

  String get components => _components;
  set components(String components) => _components = components;

  String get range => _range;
  set range(String range) => _range = range;

  String get target => _target;
  set target(String target) => _target = target;

  String get area => _area;
  set area(String area) => _area = area;

  String get effect => _effect;
  set effect(String effect) => _effect = effect;

  String get duration => _duration;
  set duration(String duration) => _duration = duration;

  String get savingThrow => _savingThrow;
  set savingThrow(String savingThrow) => _savingThrow = savingThrow;

  String get spellResistance => _spellResistance;
  set spellResistance(String spellResistance) =>
      _spellResistance = spellResistance;

  String get description => _description;
  set description(String description) => _description = description;

// Methods
  int? GetLevelByClass(CharacterClass class_) {
    if (_level.containsKey(class_)) {
      return _level[class_];
    } else {
      return null;
    }
  }

  int GetMedianClassLevel() {
    int max = 0;
    int min = 0;
    bool flag = false;
    _level.forEach((key, value) {
      if (!flag) {
        //* premiere itération
        max = value;
        min = value;
        flag = true;
      }

      if (max < value) max = value;
      if (min > value) min = value;
    });
    return ((max + min) / 2).round();
  }

  Map<CharacterClass, int> GetMapClassLevel() {
    return (_level);
  }

  @override
  String toString() {
    var levelString = "";
    _level.forEach((key, value) {
      levelString += "$key: $value, ";
    });
    //levelString = levelString.substring(0, levelString.length - 2);*/

    return "id: $_id\n"
        "name: $_name\n"
        "description: $_description\n"
        "school: $_school\n"
        "level: {$levelString}\n"
        "casting time: $_castingTime\n"
        "components: $components\n"
        "range: $_range\n"
        "target: $_target\n"
        "duration: $_duration\n";
  }

  bool equals(Spell other) {
    return _id == other._id &&
        _name == other._name &&
        _description == other._description &&
        _school == other._school &&
        const DeepCollectionEquality().equals(_level, other._level) &&
        _castingTime == other._castingTime &&
        _components == other._components &&
        _range == other._range &&
        _target == other._target &&
        _duration == other._duration;
  }

  Spell copy() {
    return Spell(
        this._id,
        this._name,
        this._level,
        this._school,
        this._castingTime,
        this._components,
        this._range,
        this._target,
        this._area,
        this._effect,
        this._duration,
        this._savingThrow,
        this._spellResistance,
        this._description);
  }
}
