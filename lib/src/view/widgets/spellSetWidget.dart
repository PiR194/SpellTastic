import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final _scrollController = ScrollController();

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
    RawKeyboard.instance.addListener((event) {
      if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
        _scrollController.animateTo(
          _scrollController.offset + 50.0,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
      if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
        _scrollController.animateTo(
          _scrollController.offset - 50.0,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    });
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
        controller: _scrollController,
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
