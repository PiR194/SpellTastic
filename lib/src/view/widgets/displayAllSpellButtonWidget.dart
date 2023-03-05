import 'package:flutter/material.dart';

class DisplayAllSpellButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFC2185B);

    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/displayallspell');
      },
      child: Icon(Icons.visibility),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(16),
        primary: primaryColor, // Couleur du bouton
      ),
    );
  }
}
