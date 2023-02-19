import 'package:code/classes/spell.dart';

class SpellSet {
    String _name;
    List<Spell> _spells;


    // Constructor
    SpellSet(this._name, [this._spells = const []]); // not sure this is the best way to initialize empty list
    
    // Getters and Setters
    String get name => _name;
    set name(String n)  => _name = n;

    List<Spell> get spells => _spells;
    set spells(List<Spell> l)  => _spells = l;
}
