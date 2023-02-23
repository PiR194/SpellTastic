import 'package:flutter/material.dart';

class DisplayAllSpellButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/displayallspell');
      },
      child: Icon(Icons.visibility),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(16),
        primary: Colors.blue, // Couleur du bouton
      ),
    );
  }
}
