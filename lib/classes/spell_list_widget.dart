import 'package:code/classes/spell.dart';
import 'package:code/classes/spell_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpellList extends StatelessWidget {
  final List<Spell> spells;

  SpellList({required this.spells});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: spells.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(spells[index].name),
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

