class Spell {
  late int _id;
  late String _name;
    
    String get name => _name;

  late String _description;
  late String _link;
  late List<String> _source;
  late List<String> _comp;
  late String _school;

  String getSchool() {
    return _school.toString();
  }

  late Map<String, int> _levels;
  late String _castingTime;
  late double _range;
  late String _target;
  late double _duration;

  Spell(
      dynamic id,
      String? name,
      String? description,
      String? link,
      List<String>? source,
      List<String>? comp,
      String? school,
      Map<String, int>? levels,
      String? castingTime,
      double? range,
      String? target,
      double? duration) {
    // Setting ID
    if (id != null) {
      _id = id;
    } else {
      throw TypeError();
    }

    // Setting name
    if (name != null) {
      _name = name;
    } else {
      throw TypeError();
    }

    // Setting description
    if (description != null) {
      _description = description;
    } else {
      _description = '';
    }

    // Setting link
    if (link != null) {
      _link = link;
    } else {
      _link = '';
    }

    // Setting source
    if (source != null) {
      _source = source;
    } else {
      _source = List<String>.empty();
    }

    // Setting levels
    if (comp != null) {
      _comp = comp;
    } else {
      _comp = List.empty(growable: true);
    }

    // Setting levels
    if (levels != null) {
      _levels = levels;
    } else {
      _levels = {};
    }

    // Setting castingTime
    if (castingTime != null) {
      _castingTime = castingTime;
    } else {
      _castingTime = '';
    }

    // Setting range
    if (range != null) {
      _range = range;
    } else {
      _range = 0;
    }

    // Setting target
    if (target != null) {
      _target = target;
    } else {
      _target = '';
    }

    // Setting duration
    if (duration != null) {
      _duration = duration;
    } else {
      _duration = 0;
    }
  }

  @override
  String toString() {
    return " id: $_id \nname: $_name \nschool: $_school";
  }
}
