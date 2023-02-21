import 'package:flutter/material.dart';
import 'spellSetWidget.dart';
import 'home.dart';

class Set extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageController setController = PageController();
    return PageView(
      controller: setController,
      children: <Widget>[
        Expanded(
          child: SpellSetWidget(
            level: '1',
          ),
        ),
        Expanded(
          child: SpellSetWidget(
            level: '2',
          ),
        ),
      ],
    );
  }
}
