import 'package:code/src/data/json_account_strategy.dart';
import 'package:code/src/model/account_manager.dart';
import 'package:code/src/model/spell.dart';
import 'package:code/src/view/widgets/pop-ups/name_set_popup.dart';
import 'package:flutter/material.dart';

import '../../model/spell_set.dart';

class CreateSetButton extends StatelessWidget {
  final Function
      onSetAdded; // callback funciton to notify parent when a new set is added

  const CreateSetButton({Key? key, required this.onSetAdded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    const Color accentColor = Color(0xFF9C27B0);
    return SizedBox(
      height: 70,
      width: screenWidth / 2,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.create),
        clipBehavior: Clip.none,
        label: const Text('New Set'),
        onPressed: () async {
          final String? result = await showDialog<String>(
            context: context,
            builder: (BuildContext context) {
              return TextInputDialog(name: 'Enter set name');
            },
          );

          if (result != null && result.isNotEmpty) {
            // Do something with the input text, such as creating a new set
            SpellSet newSet = SpellSet(result,
                spells: List<Spell>.empty(growable: true),
                level: AccountManager().selectedCharacter.level);
            AccountManager().selectedCharacter.addSet(newSet);
            onSetAdded();
            JsonAccountStrategy().saveCharacters(AccountManager().characters);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: accentColor,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          elevation: 4.0,
          textStyle: TextStyle(
            fontSize: theme.textTheme.bodyLarge!.fontSize,
            fontFamily: theme.textTheme.bodyLarge!.fontFamily,
            color: Colors.black,
            shadows: const [
              Shadow(
                color: Colors.black,
                offset: Offset(1, 1),
                blurRadius: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
