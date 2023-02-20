import 'package:code/classes/spell.dart';
import 'package:code/classes/spell_list_widget.dart';
import 'package:flutter/material.dart';

class SpellSearchDelegate extends SearchDelegate<Map<String, dynamic>> {
  final List<Spell> spells;

  SpellSearchDelegate(this.spells);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [      
      IconButton(        
        icon: const Icon(Icons.clear),        
        onPressed: () {
          query = '';        
        },      
      ),    
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, {});
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredSpells = spells.where((spell) => spell.name.toLowerCase().contains(query.toLowerCase())).toList();
    return SpellList(spells: filteredSpells);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredSpells = spells.where((spell) => spell.name.toLowerCase().contains(query.toLowerCase())).toList();
    return SpellList(spells: filteredSpells);
  }
}

