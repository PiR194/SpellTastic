import 'package:code/src/model/spell.dart';
import 'package:code/src/model/spell_set.dart';
import 'package:flutter/material.dart';

class CompareSpellListPage extends StatelessWidget {
  final SpellSet list1;
  final SpellSet list2;

  CompareSpellListPage({required this.list1, required this.list2});

  @override
  Widget build(BuildContext context) {
    SpellSet commonSpell = [];
    SpellSet uniqueSpellList1 = [];
    SpellSet uniqueSpellList2 = [];

    for (Spell s in list1) {
      if (list2.containSpell(s)) {
        commonSpell.addSpell(s);
      } else {
        uniqueSpellList1.addSpell(s);
      }
    }

    for (Spell s in list2) {
      if (!list1.containSpell(s)) {
        uniqueSpellList2.addSpell(s);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Compare Spell Set"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              list1.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            _buildTable(uniqueSpellList1),
            SizedBox(height: 16.0),
            Text(
              list2.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            _buildTable(uniqueSpellList2),
            SizedBox(height: 16.0),
            const Text(
              "Common Spell",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            _buildTable(commonSpell),
          ],
        ),
      ),
    );
  }
}
