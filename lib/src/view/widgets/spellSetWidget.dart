import 'package:code/src/model/spell_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../model/spellSetManager.dart';
import '../../model/spell_set_check_use.dart';
import '../spell_detail_page.dart';

class SpellSetWidget extends StatefulWidget {
  Map<int, bool> isCheckedList;
  final SpellSet currentSet;
  final Function(int, bool) onCheckChanged;

  SpellSetWidget(
      {Key? key,
      required this.isCheckedList,
      required this.currentSet,
      required this.onCheckChanged})
      : super(key: key);

  get spellSetCheckUse => isCheckedList;

  @override
  _SpellSetWidgetState createState() => _SpellSetWidgetState(currentSet);
}

class _SpellSetWidgetState extends State<SpellSetWidget> {
  Map<int, bool> _isCheckedList = {};
  final _scrollController = ScrollController();
  final SpellSet currentSet;

  _SpellSetWidgetState(this.currentSet);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _isCheckedList = SpellSetManager.isCheckedMapCreator(currentSet.spells);
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SpellDetailsPage(spell: spell),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Checkbox(
                      value: widget.isCheckedList[spell.id] ?? false,
                      onChanged: (value) {
                        setState(() {
                          widget.isCheckedList[spell.id] = value ?? false;
                        });
                      },
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Text(spell.name),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
