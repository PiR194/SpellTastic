import 'package:flutter/material.dart';

class CharacterButtonWidget extends StatelessWidget {
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
          Navigator.pushNamed(context, '/characterdetails');
        },
        style: ElevatedButton.styleFrom(
          primary: accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/background_home.png'),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Nom du personnage',
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
