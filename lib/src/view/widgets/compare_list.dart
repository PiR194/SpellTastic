import 'package:code/src/model/spell_set.dart';
import 'package:flutter/material.dart';

import '../../model/spell.dart';

class CompareList extends StatelessWidget {
  final SpellSet class1Spells;
  final SpellSet class2Spells;

  const CompareList({
    required this.class1Spells,
    required this.class2Spells,
  });

  SpellSet get allSpells {
    List<Spell> allSpells = [
      ...class1Spells.spells,
      ...class2Spells.spells
          .where((spell) => !class1Spells.spells.contains(spell)),
    ];
    return SpellSet('All Spells', spells: allSpells);
  }

  TextAlign getSpellAlignment(Spell spell) {
    if (class1Spells.spells.contains(spell) &&
        !class2Spells.spells.contains(spell)) {
      return TextAlign.left;
    } else if (!class1Spells.spells.contains(spell) &&
        class2Spells.spells.contains(spell)) {
      return TextAlign.right;
    } else {
      return TextAlign.center;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spells'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Class 1'),
              Text('='),
              Text('Class 2'),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: allSpells.spells.length,
              itemBuilder: (context, index) {
                final spell = allSpells.spells[index];
                return Text(
                  spell.name,
                  textAlign: getSpellAlignment(spell),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
