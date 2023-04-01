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

    const Color accentColor = Color.fromARGB(255, 50, 17, 56);

    double buttonWidth = MediaQuery.of(context).size.width / 2;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: buttonWidth,
      height: screenHeight / 9,
      child: ElevatedButton(
        onPressed: () {
          AccountManager().selectCharacter(character);
          Navigator.pushNamed(context, '/characterdetails',
              arguments: character);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                  character.characterClass.getImagePath(),
                ),
              ),
            ),
            Expanded(
              child: Text(
                character.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
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
