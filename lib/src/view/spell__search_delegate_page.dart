import '../model/spell.dart';
import 'widgets/spellSearchList_widget.dart';
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
    
    // //* retirement de la ponctuation
    // for (var i = 0; i < spells.length; i++) {
    //   spells[i].description = spells[i].description.replaceAll(RegExp(r'[^\w\s]+'), '');
    // }

    var filteredSpells = spells
      .where(
            (spell) => spell.name.toLowerCase().contains(query.toLowerCase())
                      || spell.description.replaceAll(RegExp(r'[^\w\s]+'), '').toLowerCase().contains(query.toLowerCase())
        )
        .toList();
    return SpellSearchList(spells: filteredSpells, query : query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredSpells = spells
        .where(
            (spell) => spell.name.toLowerCase().contains(query.toLowerCase())
                      || spell.description.toLowerCase().contains(query.toLowerCase())
        )
        .toList();
    // //* retirement de la ponctuation
    // for (var i = 0; i < filteredSpells.length; i++) {
    //   filteredSpells[i].description = filteredSpells[i].description.replaceAll(RegExp(r'[^\w\s]+'), '');
    // }
    return SpellSearchList(spells: filteredSpells, query : query);
  }
}
