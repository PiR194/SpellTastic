import 'package:flutter/material.dart';

class LevelCounterWidget extends StatefulWidget {
  @override
  _LevelCounter createState() => _LevelCounter();
}

class _LevelCounter extends State<LevelCounterWidget> {
  int _count = 0;

  void _incrementCount() {
    setState(() {
      if (_count < 20) {
        _count++;
      }
    });
  }

  void _decrementCount() {
    setState(() {
      if (_count > 0) {
        _count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_upward),
          onPressed: _incrementCount,
        ),
        Text('$_count'),
        IconButton(
          icon: Icon(Icons.arrow_downward),
          onPressed: _decrementCount,
        ),
      ],
    );
  }
}
