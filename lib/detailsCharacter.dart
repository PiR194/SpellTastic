import 'package:code/levelCounterWidget.dart';
import 'package:code/displaySetButtonWidget.dart';
import 'package:flutter/material.dart';
import 'createSetButtonWidget.dart';
import 'home.dart';

class DetailsCharacter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Wrap(children: [
        Expanded(
          child: Row(
            children: [
              LevelCounterWidget(),
              Expanded(
                child: Column(children: [
                  Text('NAME : name'),
                  Row(
                    children: [
                      Text('RACE : race'),
                      Text('CLASSE: class'),
                    ],
                  )
                ]),
              )
            ],
          ),
        ),
        Center(
          child: CreateSetButton(),
        ),
        Center(
          child: DisplaySetButton(),
        ),
        Center(
          child: DisplaySetButton(),
        ),
        Center(
          child: DisplaySetButton(),
        ),
      ]),
    );
  }
}
