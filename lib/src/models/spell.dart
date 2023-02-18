class Spell {
  late int _id;
  late String _name;
  late String _description;
  late String _link;
  late List<String> _comp;
  late String _school;
  late Map<String, int> _levels;
  late String _castingTime;
  late double _range;
  late String _target;
  late double _duration;

  Spell(id, name, description, link, comp, school, levels, castingTime, range,
      target, duration) {
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
      throw TypeError();
    }

    // Setting range
    if (range != null) {
      _range = range;
    } else {
      throw TypeError();
    }

    // Setting target
    if (target != null) {
      _target = target;
    } else {
      throw TypeError();
    }

    // Setting duration
    if (duration != null) {
      _duration = duration;
    } else {
      throw TypeError();
    }
  }

  @override
  String toString() {
    return " id: $_id \nname: $_name \nschool: $_school";
  }
}
