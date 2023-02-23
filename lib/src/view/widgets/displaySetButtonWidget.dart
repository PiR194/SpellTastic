import '../home.dart';
import 'package:flutter/material.dart';

class DisplaySetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double halfWidth = MediaQuery.of(context).size.width / 2;
    return SizedBox(
      height: 70,
      width: halfWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.brown[800],
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 6.0,
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.grey,
                offset: Offset(1, 1),
                blurRadius: 2,
              ),
            ],
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/setdisplay');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Nom du set'),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Modifier le set (à implémenter)
                  },
                  child: Text('Modify'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 180, 122, 101),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Supprimer le set (à implémenter)
                  },
                  child: Text('Delete'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 180, 122, 101),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
