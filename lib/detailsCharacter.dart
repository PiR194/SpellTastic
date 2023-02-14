import 'package:code/levelCounterWidget.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class Details_character extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            LevelCounterWidget(),
            Column(children: [
              Text('NAME : name'),
              Row(
                children: [
                  Text('RACE : race'),
                  Text('CLASSE: class'),
                ],
              )
            ])
          ],
        ),
      ),
    );
  }
}
