import 'package:code/home.dart';
import 'package:flutter/material.dart';

class CreateSetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sixWidth = MediaQuery.of(context).size.width / 6;
    return SizedBox(
      height: 70,
      width: sixWidth,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 139, 134, 132)),
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
