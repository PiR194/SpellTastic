import '../home.dart';
import 'package:flutter/material.dart';

class DisplaySetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    const Color accentColor = Color(0xFF9C27B0);
    const Color primaryColor = Color(0xFFC2185B);

    return SizedBox(
      height: 70,
      width: screenWidth / 1.02,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: accentColor,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(
              color: Colors.amber,
              width: 2,
            ),
          ),
          elevation: 6.0,
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/setdisplay');
        },
        child: Wrap(
          spacing: screenWidth * 0.05,
          runSpacing: screenHeight * 0.02,
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          children: [
            Text(
              'Nom du set',
              style: TextStyle(
                fontFamily: 'Anaktoria',
              ),
            ),
            Wrap(
              spacing: screenWidth * 0.02,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Modifier le set (à implémenter)
                  },
                  child: Text('Use'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Modifier le set (à implémenter)
                  },
                  child: Text('Modify'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Supprimer le set (à implémenter)
                  },
                  child: Text('Delete'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
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
