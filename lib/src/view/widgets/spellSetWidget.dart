import 'package:flutter/material.dart';

import '../../model/spell_set_check_use.dart';

class SpellSetWidget extends StatefulWidget {
  final String level;
  final SpellSetCheckUse spellSetCheckUse;

  SpellSetWidget(
      {Key? key, required this.level, required this.spellSetCheckUse})
      : super(key: key);

  @override
  _SpellSetWidgetState createState() => _SpellSetWidgetState();
}

class _SpellSetWidgetState extends State<SpellSetWidget> {
  late List<bool> _isCheckedList;

  @override
  void dispose() {
    widget.spellSetCheckUse.isCheckedList = _isCheckedList;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _isCheckedList = List.generate(
        30, (index) => widget.spellSetCheckUse.isCheckedList[index]);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const Color primaryColor = Color(0xFFC2185B);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LEVEL ${widget.level}',
          style: TextStyle(
            fontSize: theme.textTheme.bodyLarge!.fontSize,
            fontFamily: theme.textTheme.bodyLarge!.fontFamily,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
      ),
      body: ListView.builder(
        itemExtent: 50,
        cacheExtent: 2,
        itemCount: 30,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(
              "spell",
              style: TextStyle(
                fontSize: theme.textTheme.bodyMedium!.fontSize,
                fontFamily: theme.textTheme.bodyMedium!.fontFamily,
              ),
            ),
            value: _isCheckedList[index],
            onChanged: (value) {
              setState(() {
                _isCheckedList[index] = value!;
                widget.spellSetCheckUse.isCheckedList = _isCheckedList;
              });
            },
          );
        },
      ),
    );
  }
}
