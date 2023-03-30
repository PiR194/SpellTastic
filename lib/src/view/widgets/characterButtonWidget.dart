import 'package:code/src/model/character_class.dart';
import 'package:code/src/model/character.dart';
import 'package:flutter/material.dart';

import '../../model/account_manager.dart';

class CharacterButtonWidget extends StatelessWidget {
  final Character character;

  const CharacterButtonWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const Color accentColor = Color(0xFF9C27B0);

    double buttonWidth = MediaQuery.of(context).size.width / 2;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: buttonWidth,
      height: screenHeight / 8,
      child: ElevatedButton(
        onPressed: () {
          AccountManager().selectCharacter(character);
          Navigator.pushNamed(context, '/characterdetails',
              arguments: character);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage(character.characterClass.getImagePath()),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                character.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: theme.textTheme.bodyLarge!.fontSize,
                  fontFamily: theme.textTheme.bodyLarge!.fontFamily,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
