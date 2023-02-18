import 'package:flutter/material.dart';

import 'home.dart';

class CreateSetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sixWidth = MediaQuery.of(context).size.width / 6;
    return SizedBox(
      height: 70,
      width: sixWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.grey,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          elevation: 4.0,
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(1, 1),
                blurRadius: 2,
              ),
            ],
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
          children: [
            Text('Create Set'),
          ],
        ),
      ),
    );
  }
}
