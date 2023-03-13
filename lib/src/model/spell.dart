import 'package:collection/collection.dart';
import 'package:code/src/model/character_class.dart';

class Spell {
  // Setting id
  int _id;
  int get id => _id;

  String _name;
  String get name => _name;
  set name(String name) => _name = name;

  String _description;
  String get description => _description;
  set description(String description) => _description = description;

  String _reference;
  String get reference => _reference;
  set reference(String reference) => _reference = reference;

  String _source;
  String get source => _source;
  set source(String source) => _source = source;

  String _school;
  String get school => _school;
  set school(String school) => _school = school;

  Map<String, int> _level;
  Map<String, int> get level => _level;
  set level(Map<String, int> level) => _level = level;

  String _castingTime;
  String get castingTime => _castingTime;
  set castingTime(String castingTime) => _castingTime = castingTime;

  List<String> _components;
  List<String> get components => _components;
  set components(List<String> components) => _components = components;

  String _range;
  String get range => _range;
  set range(String range) => _range = range;

  String _target;
  String get target => _target;
  set target(String target) => _target = target;

  String _duration;
  String get duration => _duration;
  set duration(String duration) => _duration = duration;
  Spell(
      this._id,
      this._name,
      this._description,
      this._reference,
      this._source,
      this._school,
      this._level,
      this._castingTime,
      this._components,
      this._range,
      this._target,
      this._duration);

  // ignore: non_constant_identifier_names
  int? GetLevelByClass(String class_) {
    //  print(_level);
    if (_level.containsKey(class_)) {
      return _level[class_];
    } else {
      return null;
    }
  }

  @override
  String toString() {
    var levelString = "";
    _level.forEach((key, value) {
      levelString += "$key: $value, ";
    });
    //levelString = levelString.substring(0, levelString.length - 2);*/

    var componentsString = "";
    _components.forEach((element) {
      componentsString += "$element,";
    });

    return "id: $_id\n"
        "name: $_name\n"
        "description: $_description\n"
        "reference: $_reference\n"
        "source: $_source\n"
        "school: $_school\n"
        "level: {$levelString}\n"
        "casting time: $_castingTime\n"
        "components: [$componentsString]\n"
        "range: $_range\n"
        "target: $_target\n"
        "duration: $_duration\n";
  }

  bool equals(Spell other) {
    return _id == other._id &&
        _name == other._name &&
        _description == other._description &&
        _reference == other._reference &&
        _source == other._source &&
        _school == other._school &&
        const DeepCollectionEquality().equals(_level, other._level) &&
        _castingTime == other._castingTime &&
        const ListEquality().equals(_components, other._components) &&
        _range == other._range &&
        _target == other._target &&
        _duration == other._duration;
  }
}
