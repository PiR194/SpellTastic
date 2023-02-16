import 'package:code/home.dart';
import 'package:flutter/material.dart';

class DisplaySetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double halfWidth = MediaQuery.of(context).size.width / 2;
    return SizedBox(
      height: 70,
      width: halfWidth,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 165, 120, 104)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
              side: BorderSide(width: 2.0, color: Colors.red),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
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
                ),
                ElevatedButton(
                  onPressed: () {
                    // Supprimer le set (à implémenter)
                  },
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
