import 'package:code/src/model/account_manager.dart';
import 'package:code/src/model/spell_set.dart';
import 'package:flutter/material.dart';

import '../../model/character_class.dart';
import '../../model/spell.dart';
import '../spell_detail_page.dart';

class ComparePage extends StatefulWidget {
  const ComparePage({Key? key}) : super(key: key);

  @override
  _ComparePageState createState() => _ComparePageState();
}

class _ComparePageState extends State<ComparePage> {
  CharacterClass? selectedClass1;
  CharacterClass? selectedClass2;

  // final List<CharacterClass> classes = [
  //   CharacterClass('Class 1', []),
  //   CharacterClass('Class 2', []),
  // ];

  SpellSet get class1Spells => selectedClass1 != null
      ? SpellSet('Class 1 Spells',
          spells: AccountManager()
              .allSpells
              .spells
              .where((spell) => spell.GetLevelByClass(selectedClass1!) != null)
              .toList())
      : SpellSet('Class 1 Spells', spells: []);

  SpellSet get class2Spells => selectedClass2 != null
      ? SpellSet('Class 2 Spells',
          spells: AccountManager()
              .allSpells
              .spells
              .where((spell) => spell.GetLevelByClass(selectedClass2!) != null)
              .toList())
      : SpellSet('Class 2 Spells', spells: []);

  List<Spell> get allSpells {
    final List<Spell> spells1 = class1Spells.spells;
    final List<Spell> spells2 = class2Spells.spells;
    final List<Spell> commonSpells = spells1
        .where((spell1) => spells2.any((spell2) => spell1 == spell2))
        .toList();

    final List<Spell> allSpells = [...spells1, ...spells2, ...commonSpells];
    allSpells.sort((spell1, spell2) => spell1.name.compareTo(spell2.name));

    return allSpells;
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
    final theme = Theme.of(context);

    const Color accentColor = Color(0xFF9C27B0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Compare'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text('Class 1'),
              Text('='),
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
                items: [
                  for (var characterClass in CharacterClass.values)
                    DropdownMenuItem<CharacterClass>(
                      value: characterClass,
                      child: Text(characterClass.name),
                    ),
                ],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: theme.textTheme.bodyLarge!.fontSize,
                  fontFamily: theme.textTheme.bodyLarge!.fontFamily,
                ),
                underline: Container(
                  height: 2,
                  color: accentColor,
                ),
              ),
              DropdownButton<CharacterClass>(
                value: selectedClass2,
                onChanged: (value) {
                  setState(() {
                    selectedClass2 = value;
                  });
                },
                items: [
                  for (var characterClass in CharacterClass.values)
                    DropdownMenuItem<CharacterClass>(
                      value: characterClass,
                      child: Text(characterClass.name),
                    ),
                ],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: theme.textTheme.bodyLarge!.fontSize,
                  fontFamily: theme.textTheme.bodyLarge!.fontFamily,
                ),
                underline: Container(
                  height: 2,
                  color: accentColor,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemExtent: 50,
              cacheExtent: 2,
              itemCount: allSpells.length,
              itemBuilder: (context, index) {
                final spell = allSpells[index];
                return ListTile(
                  title: Text(
                    spell.name,
                    textAlign: getSpellAlignment(spell),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SpellDetailsPage(spell: allSpells[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
