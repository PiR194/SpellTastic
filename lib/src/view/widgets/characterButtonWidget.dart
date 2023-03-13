import 'package:code/src/model/character.dart';
import 'package:flutter/material.dart';

class CharacterButtonWidget extends StatelessWidget {
  final Character character;

  const CharacterButtonWidget({required this.character});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const Color accentColor = Color(0xFF9C27B0);

    double buttonWidth = MediaQuery.of(context).size.width / 1.1;

    return SizedBox(
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/characterdetails');
        },
        style: ElevatedButton.styleFrom(
          primary: accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/background_home.png'),
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
