import 'package:flutter/material.dart';

class SelectSetButtonWidget extends StatefulWidget {
  @override
  _SelectSetButtonState createState() => _SelectSetButtonState();
}

class _SelectSetButtonState extends State<SelectSetButtonWidget> {
  String? _selectedOption = 'Set 1';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButton<String>(
        value: _selectedOption,
        items: [
          DropdownMenuItem(
            child: Text('Set 1'),
            value: 'Set 1',
          ),
          DropdownMenuItem(
            child: Text('Set 2'),
            value: 'Set 2',
          ),
        ],
        onChanged: (value) {
          setState(() {
            _selectedOption = value;
          });
        },
      ),
    );
  }
}
