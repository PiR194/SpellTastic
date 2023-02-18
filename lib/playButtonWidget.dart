import 'package:code/home.dart';
import 'package:flutter/material.dart';

class PlayButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sixWidth = MediaQuery.of(context).size.width / 6;
    return SizedBox(
      height: 70,
      width: sixWidth,
      child: ElevatedButton.icon(
        icon: Icon(Icons.play_arrow_outlined),
        label: Text('PLAY'),
        onPressed: () {
          // Code à exécuter lorsque le bouton est cliqué
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          onPrimary: Colors.white,
        ),
      ),
    );
  }
}
