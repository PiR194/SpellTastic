import 'package:code/src/view/dynamic_spell_list.dart';
import 'package:flutter/material.dart';

import '../../model/account_manager.dart';
import '../../model/spell_set.dart';

class SpellDisplayWidget extends StatelessWidget {
  final SpellSet spellSet;

  const SpellDisplayWidget({super.key, required this.spellSet});

  @override
  Widget build(BuildContext context) {
    // propreties for responsivity / theme
    final theme = Theme.of(context);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: 50,
      width: screenWidth / 2.5,
      child: ElevatedButton.icon(
          icon: const Icon(Icons.class_outlined),
          clipBehavior: Clip.none,
          label: Text(spellSet.name),
          onPressed: () {
            DynamicSpellList(
                spellSet: spellSet,
                characterClass:
                    AccountManager().selectedCharacter.characterClass);
          }),
    );
  }
}
