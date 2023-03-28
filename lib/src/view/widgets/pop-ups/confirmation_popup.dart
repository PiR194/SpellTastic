import 'package:flutter/material.dart';

class ConfirmationPopup extends StatefulWidget {
  final String warning;

  ConfirmationPopup({required this.warning});

  @override
  _ConfirmationPopup createState() => _ConfirmationPopup();
}

class _ConfirmationPopup extends State<ConfirmationPopup> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.warning),
      content: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(hintText: 'mySet'),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('YES'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: const Text('NO'),
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
