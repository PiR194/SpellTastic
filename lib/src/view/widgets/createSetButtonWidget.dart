import 'package:flutter/material.dart';

class CreateSetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    const Color accentColor = Color(0xFF9C27B0);
    return SizedBox(
      height: 70,
      width: screenWidth / 2,
      child: ElevatedButton.icon(
        icon: Icon(Icons.create),
        clipBehavior: Clip.none,
        label: Text('New Set'),
        onPressed: () {
          // Code à exécuter lorsque le bouton est cliqué
        },
        style: ElevatedButton.styleFrom(
          primary: accentColor,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          elevation: 4.0,
          textStyle: TextStyle(
            fontSize: theme.textTheme.bodyLarge!.fontSize,
            fontFamily: theme.textTheme.bodyLarge!.fontFamily,
            color: Colors.black,
            shadows: const [
              Shadow(
                color: Colors.black,
                offset: Offset(1, 1),
                blurRadius: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
