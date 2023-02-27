import 'package:flutter/material.dart';
import 'widgets/spellSetWidget.dart';
import 'home.dart';

class SetDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageController setController = PageController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Nom du set'),
        backgroundColor: Colors.black,
      ),
      body: PageView(
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
      ),
    );
  }
}