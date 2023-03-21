import 'package:flutter/material.dart';

class LevelCounterWidget extends StatefulWidget {
  final characterLevel;

  const LevelCounterWidget({super.key, required this.characterLevel});

  @override
  _LevelCounter createState() => _LevelCounter(characterLevel);
}

class _LevelCounter extends State<LevelCounterWidget> {
  late int count;

  _LevelCounter(this.count);

  void _incrementCount() {
    setState(() {
      if (count < 20) {
        count++;
      }
    });
  }

  void _decrementCount() {
    setState(() {
      if (count > 1) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_downward),
          onPressed: _decrementCount,
        ),
        Text(
          '$count',
          style: TextStyle(
            fontSize: theme.textTheme.bodyMedium!.fontSize,
            fontFamily: theme.textTheme.bodyMedium!.fontFamily,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_upward),
          onPressed: _incrementCount,
        ),
      ],
    );
  }
}
