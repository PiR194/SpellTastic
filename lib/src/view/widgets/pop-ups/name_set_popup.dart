import 'package:flutter/material.dart';

class TextInputDialog extends StatefulWidget {
  final String name;

  TextInputDialog({required this.name});

  @override
  _TextInputDialogState createState() => _TextInputDialogState();
}

class _TextInputDialogState extends State<TextInputDialog> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.name),
      content: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(hintText: 'mySet'),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('CANCEL'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: const Text('OK'),
          onPressed: () =>
              Navigator.of(context).pop(_textEditingController.text),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
