import 'package:flutter/material.dart';

class CharacterButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const Color accentColor = Color(0xFF9C27B0);

    double buttonWidth = MediaQuery.of(context).size.width / 2;

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
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/background_home.png'),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Nom du personnage',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
