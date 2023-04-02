import '../model/spell.dart';
import 'widgets/spellSearchList_widget.dart';
import 'package:flutter/material.dart';

class SpellSearchDelegate extends SearchDelegate<Map<String, dynamic>> {
  final List<Spell> spells;
  final bool isAddable;
  final String nameSet;
  final Function added;

  SpellSearchDelegate(this.spells, this.added,
      {this.isAddable = false, this.nameSet = ""});

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

  //* Affichage de la recherche

  @override
  Widget buildResults(BuildContext context) {
    var filteredSpells = spells
        .where((spell) =>
                spell.name.toLowerCase().contains(query.toLowerCase()) ||
                spell.description.toLowerCase().contains(
                    query.toLowerCase()) //* la regex retire la ponctuation
            )
        .toList();
    return SpellSearchList(
        added: added,
        spells: filteredSpells,
        query: query,
        isAddable: isAddable,
        nameSet: nameSet);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredSpells = spells
        .where((spell) =>
            spell.name.toLowerCase().contains(query.toLowerCase()) ||
            spell.description.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return SpellSearchList(
        added: added,
        spells: filteredSpells,
        query: query,
        isAddable: isAddable,
        nameSet: nameSet);
  }
}
