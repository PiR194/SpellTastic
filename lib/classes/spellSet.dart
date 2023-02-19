import 'package:code/classes/spell.dart';

class SpellSet {
    String _name;
    List<Spell> _spells = [];


    // Constructor
    SpellSet(this._name); 
    
    // Getters and Setters
    String get name => _name;
    set name(String n)  => _name = n;

    List<Spell> get spells => _spells;
    set spells(List<Spell> l)  => _spells = l;

    // Methods
    void addSpell(Spell s) {
        _spells.add(s);
    }

    void removeSpell(Spell s) {
        _spells.remove(s);
    }

    Spell getSpellByName(String name) {
        return _spells.firstWhere((s) => s.name == name);
    }
}
