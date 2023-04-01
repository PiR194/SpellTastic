import 'package:code/src/model/spell_set.dart';
import 'package:flutter/material.dart';

import '../../model/character_class.dart';
import '../../model/spell.dart';

class ComparePage extends StatefulWidget {
  const ComparePage({Key? key}) : super(key: key);

  @override
  _ComparePageState createState() => _ComparePageState();
}

class _ComparePageState extends State<ComparePage> {
  CharacterClass? selectedClass1;
  CharacterClass? selectedClass2;

  final List<CharacterClass> classes = [
    CharacterClass('Class 1', []),
    CharacterClass('Class 2', []),
  ];

  SpellSet get class1Spells => selectedClass1 != null
      ? SpellSet('Class 1 Spells', spells: selectedClass1!.spells)
      : SpellSet('Class 1 Spells', spells: []);

  SpellSet get class2Spells => selectedClass2 != null
      ? SpellSet('Class 2 Spells', spells: selectedClass2!.spells)
      : SpellSet('Class 2 Spells', spells: []);

  List<Spell> get allSpells {
    final List<Spell> spells1 = class1Spells.spells;
    final List<Spell> spells2 = class2Spells.spells;
    final List<Spell> commonSpells = spells1
        .where((spell1) => spells2.any((spell2) => spell1 == spell2))
        .toList();

    return [...spells1, ...spells2, ...commonSpells];
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
        title: const Text('Compare'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Class 1'),
              const Text('='),
              Text('Class 2'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton<CharacterClass>(
                value: selectedClass1,
                onChanged: (value) {
                  setState(() {
                    selectedClass1 = value;
                  });
                },
                items: classes.map((characterClass) {
                  return DropdownMenuItem<CharacterClass>(
                    value: characterClass,
                    child: Text(characterClass.name),
                  );
                }).toList(),
              ),
              DropdownButton<CharacterClass>(
                value: selectedClass2,
                onChanged: (value) {
                  setState(() {
                    selectedClass2 = value;
                  });
                },
                items: classes.map((characterClass) {
                  return DropdownMenuItem<CharacterClass>(
                    value: characterClass,
                    child: Text(characterClass.name),
                  );
                }).toList(),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: allSpells.length,
              itemBuilder: (context, index) {
                final spell = allSpells[index];
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
