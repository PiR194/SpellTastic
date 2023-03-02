import 'package:flutter/material.dart';

class SpellSetWidget extends StatelessWidget {
  String level;
  SpellSetWidget({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'LEVEL $level',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.brown,
              decoration: TextDecoration.none,
            ),
          ),
          ListView(scrollDirection: Axis.vertical, shrinkWrap: true, children: [
            for (int i = 0; i < 30; i++)
              Text(
                'Item $i',
                style: const TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              ),
          ])
        ],
      ),
    );
  }
}
