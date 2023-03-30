import 'package:code/src/model/account_manager.dart';
import 'package:code/src/model/spell_set.dart';
import 'package:flutter/material.dart';

import '../../model/character_class.dart';
import 'characterFormWidget.dart';

class AddCharacterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const Color primaryColor = Color(0xFFC2185B);

    double buttonWidth = MediaQuery.of(context).size.width / 2;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: buttonWidth,
      height: screenHeight / 14,
      child: ElevatedButton(
        onPressed: () {
          AccountManager().selectedCharacter.sets.add(SpellSet("All Spells"));
          AccountManager()
              .allSpells
              .spells
              .where((spell) =>
                  spell.GetLevelByClass(
                      AccountManager().selectedCharacter.characterClass) !=
                  null)
              .toList();
          Navigator.pushNamed(context, '/characterform');
        },
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              " + ",
              style: TextStyle(
                fontSize: theme.textTheme.bodyLarge!.fontSize,
                fontFamily: theme.textTheme.bodyLarge!.fontFamily,
              ),
            )
          ],
        ),
      ),
    );
  }
}
