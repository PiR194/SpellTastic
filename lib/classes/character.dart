import 'package:code/classes/spell.dart';
import 'package:code/classes/spellSet.dart';

class Character {
    String _name;
    final String _cclass; // change into actual cclass Class 
    int _level;
    List<SpellSet> _sets;
    List<Spell> _knownSpells;

    // Constructor
    Character(this._name, this._cclass, this._level, [this._sets = const [], this._knownSpells = const []]);
    
    // Getters and Setters
    String get name => _name;
    set name(String n)  => _name = n;

    String get cclass => _cclass;

    int get level => _level;
    set level(int l)  => _level = l;

    List<SpellSet> get sets => _sets;
    set sets(List<SpellSet> sets)  => _sets = sets;

}
