import 'package:collection/collection.dart';

class Spell {
  // Setting id
  int _id;

  String _name;
  String get name => _name;

  String _description;
  String get description => _description;
  String _reference;
  // Setting source
  String _source;
  String get source => _source;

  String _school;
  String get school => _school;

  Map<String, int> _level;
  String _castingTime;
  List<String> _components;
  String _range;
  String _target;
  String _duration;

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
    print(_level);
    if (_level.containsKey(class_)) {
      return _level[class_];
    } else {
      return null;
    }
  }

  @override
  String toString() {
    return " id: $_id \nname: $_name \nschool: $_school";
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
