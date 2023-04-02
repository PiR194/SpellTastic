import 'package:code/src/data/json_account_strategy.dart';
import 'package:code/src/model/account_manager.dart';
import 'package:flutter/material.dart';

class LevelCounterWidget extends StatefulWidget {
  final int characterLevel;
  final Function? onSetUpdate;

  const LevelCounterWidget(
      {Key? key, required this.characterLevel, this.onSetUpdate})
      : super(key: key);

  @override
  _LevelCounter createState() => _LevelCounter(characterLevel, onSetUpdate);
}

class _LevelCounter extends State<LevelCounterWidget> {
  late int maxLevel = widget.characterLevel;
  final Function? onSetUpdate;

  _LevelCounter(this.maxLevel, this.onSetUpdate);

  void _incrementCount() {
    setState(() {
      if (AccountManager().selectedCharacter.level < maxLevel) {
        AccountManager().selectedCharacter.level++;
        JsonAccountStrategy().saveCharacters(AccountManager().characters);
        if (onSetUpdate != null) {
          onSetUpdate!();
        }
      }
    });
  }

  void _decrementCount() {
    setState(() {
      if (AccountManager().selectedCharacter.level > 1) {
        AccountManager().selectedCharacter.level--;
        JsonAccountStrategy().saveCharacters(AccountManager().characters);
        if (onSetUpdate != null) {
          onSetUpdate!();
        }
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
          "${AccountManager().selectedCharacter.level}",
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
