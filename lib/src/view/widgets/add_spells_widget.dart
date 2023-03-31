import 'package:flutter/material.dart';

import '../../model/spell_set.dart';

class AddSpellWidget extends StatelessWidget {
  final SpellSet spellSet;

  const AddSpellWidget({super.key, required this.spellSet});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Icon(Icons.add),
      onPressed: () {
        print("add spell");
      },
    );
  }
}
