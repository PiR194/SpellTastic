import '../../model/spell.dart';
import '../spell_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpellList extends StatelessWidget {
  final List<Spell> spells;

  SpellList({required this.spells});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.builder(
      itemCount: spells.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            spells[index].name,
            style: TextStyle(
              fontSize: theme.textTheme.bodyMedium!.fontSize,
              fontFamily: theme.textTheme.bodyMedium!.fontFamily,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SpellDetailsPage(spell: spells[index]),
              ),
            );
          },
        );
      },
    );
  }
}
