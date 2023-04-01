import 'package:code/src/data/json_account_strategy.dart';
import 'package:code/src/model/account_manager.dart';
import 'package:code/src/model/spell_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../model/spellSetManager.dart';
import '../../model/spell_set_check_use.dart';
import '../spell_detail_page.dart';

class SpellSetWidget extends StatefulWidget {
  Map<String, bool> isCheckedList;
  final SpellSet currentSet;
  final Function(String, bool) onCheckChanged;
  final String fullSetName;

  SpellSetWidget(
      {Key? key,
      required this.isCheckedList,
      required this.currentSet,
      required this.onCheckChanged,
      required this.fullSetName})
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

  Object get fullSetName => fullSetName;

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
      body: ListView.builder(
        controller: _scrollController,
        cacheExtent: 2,
        itemCount: currentSet.spells.length,
        itemBuilder: (context, index) {
          final spell = currentSet.spells[index];
          final isCheckedKey = '${widget.currentSet.name}-$index';
          final isChecked = widget.isCheckedList[isCheckedKey] ??
              (AccountManager()
                          .selectedCharacter
                          .spellSetPositions[spell.name] !=
                      null &&
                  AccountManager()
                      .selectedCharacter
                      .spellSetPositions[spell.name]!
                      .contains(index));
          var textStyle = isChecked
              ? const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                )
              : const TextStyle();
          if (AccountManager()
                      .selectedCharacter
                      .spellSetPositions[spell.name] !=
                  null &&
              AccountManager()
                  .selectedCharacter
                  .spellSetPositions[spell.name]!
                  .contains(index)) {
            textStyle = const TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey,
            );
          }
          return Padding(
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
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        widget.isCheckedList[isCheckedKey] = value ?? false;
                      });
                      if (value == true) {
                        if (AccountManager()
                                .selectedCharacter
                                .spellSetPositions[spell.name] ==
                            null) {
                          // If the key is not present in the map, create a new list for the key
                          AccountManager()
                              .selectedCharacter
                              .spellSetPositions[spell.name] = [index];
                        } else {
                          AccountManager()
                              .selectedCharacter
                              .spellSetPositions[spell.name]
                              ?.add(index);
                        }
                        JsonAccountStrategy()
                            .saveCharacters(AccountManager().characters);
                      } else {
                        if (AccountManager()
                                .selectedCharacter
                                .spellSetPositions[spell.name] ==
                            null) {
                          // If the key is not present in the map, create a new list for the key
                          AccountManager()
                              .selectedCharacter
                              .spellSetPositions[spell.name] = [index];
                        } else {
                          AccountManager()
                              .selectedCharacter
                              .spellSetPositions[spell.name]
                              ?.remove(index);
                        }
                        JsonAccountStrategy()
                            .saveCharacters(AccountManager().characters);
                      }
                    },
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      spell.name,
                      style: textStyle,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
