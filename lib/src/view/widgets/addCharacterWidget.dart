import 'package:flutter/material.dart';

class AddCharacterWidget extends StatefulWidget {
  @override
  _AddCharacterWidgetState createState() => _AddCharacterWidgetState();
}

class _AddCharacterWidgetState extends State<AddCharacterWidget> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    double buttonWidth = MediaQuery.of(context).size.width / 2;
    final screenHeight = MediaQuery.of(context).size.height;

    const primaryGradient = LinearGradient(
      colors: [Color(0xFFFF512F), Color(0xFFDD2476)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );

    return SizedBox(
      width: buttonWidth,
      height: screenHeight / 14,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: primaryGradient,
        ),
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, '/characterform');
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          icon: Icon(
            Icons.add_circle_outline,
            size: theme.textTheme.bodyLarge!.fontSize,
            color: Colors.white,
          ),
          label: Text(
            "Add new character",
            style: TextStyle(
              fontSize: theme.textTheme.bodyLarge!.fontSize,
              fontFamily: theme.textTheme.bodyLarge!.fontFamily,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
