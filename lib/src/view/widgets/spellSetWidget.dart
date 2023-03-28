import 'package:code/src/model/spell_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../model/spell_set_check_use.dart';

class SpellSetWidget extends StatefulWidget {
  final SpellSetCheckUse spellSetCheckUse;
  final SpellSet currentSet;

  const SpellSetWidget(
      {Key? key, required this.spellSetCheckUse, required this.currentSet})
      : super(key: key);

  @override
  _SpellSetWidgetState createState() => _SpellSetWidgetState(currentSet);
}

class _SpellSetWidgetState extends State<SpellSetWidget> {
  late List<bool> _isCheckedList;
  final _scrollController = ScrollController();
  final SpellSet currentSet;

  _SpellSetWidgetState(this.currentSet);

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
          currentSet.name,
          style: TextStyle(
            fontSize: theme.textTheme.bodyLarge!.fontSize,
            fontFamily: theme.textTheme.bodyLarge!.fontFamily,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
      ),
      body: ListView(
        controller: _scrollController,
        cacheExtent: 2,
        children: [
          for (var spell in currentSet.spells)
            CheckboxListTile(
              title: Text(
                spell.name,
                style: TextStyle(
                  fontSize: theme.textTheme.bodyMedium!.fontSize,
                  fontFamily: theme.textTheme.bodyMedium!.fontFamily,
                ),
              ),
              value: _isCheckedList[spell.id],
              onChanged: (value) {
                setState(() {
                  _isCheckedList[spell.id] = value!;
                  widget.spellSetCheckUse.isCheckedList = _isCheckedList;
                });
              },
            ),
        ],
      ),
    );
  }
}
