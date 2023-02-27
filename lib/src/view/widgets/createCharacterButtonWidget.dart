import 'package:flutter/material.dart';

import 'characterFormWidget.dart';

class CreateCharacterButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width / 2;
    return SizedBox(
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/characterform');
        },
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 123, 184, 235),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [Text("+++ Add a Character +++")],
        ),
      ),
    );
  }
}
