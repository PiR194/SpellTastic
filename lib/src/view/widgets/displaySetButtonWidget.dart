import 'package:code/src/data/json_account_strategy.dart';
import 'package:code/src/model/spell_set.dart';
import 'package:code/src/view/widgets/pop-ups/name_set_popup.dart';

import '../../model/account_manager.dart';
import '../home.dart';
import 'package:flutter/material.dart';

import '../set_display.dart';

class DisplaySetButton extends StatelessWidget {
  final SpellSet spellSet;
  final Function onSetUpdate;

  const DisplaySetButton(
      {super.key, required this.spellSet, required this.onSetUpdate});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    const Color accentColor = Color(0xFF9C27B0);
    const Color primaryColor = Color(0xFFC2185B);

    return SizedBox(
      height: 70,
      width: screenWidth / 1.02,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentColor,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: const BorderSide(
              color: Colors.amber,
              width: 2,
            ),
          ),
          elevation: 6.0,
          textStyle: TextStyle(
            fontSize: theme.textTheme.bodyLarge!.fontSize,
            fontFamily: theme.textTheme.bodyLarge!.fontFamily,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SetDisplay(fullSet: spellSet, isModify: false),
            ),
          );
        },
        child: Wrap(
          spacing: screenWidth * 0.05,
          runSpacing: screenHeight * 0.02,
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          children: [
            Text(
              spellSet.name,
              style: TextStyle(
                fontSize: theme.textTheme.bodyLarge!.fontSize,
                fontFamily: theme.textTheme.bodyLarge!.fontFamily,
                fontWeight: theme.textTheme.bodyLarge!.fontWeight,
              ),
            ),
            Wrap(
              spacing: screenWidth * 0.02,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  //* Use
                  onPressed: () {
                    // Use le set (à implémenter)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SetDisplay(
                          fullSet: spellSet,
                          isModify: false,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    'Use',
                    style: TextStyle(
                      fontSize: theme.textTheme.bodyMedium!.fontSize,
                      fontFamily: theme.textTheme.bodyMedium!.fontFamily,
                    ),
                  ),
                ),
                ElevatedButton(
                  //* Modify
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SetDisplay(fullSet: spellSet, isModify: true),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: theme.textTheme.bodyMedium!.fontSize,
                      fontFamily: theme.textTheme.bodyMedium!.fontFamily,
                    ),
                  ),
                ),
                ElevatedButton(
                  //* Rename
                  onPressed: () async {
                    final String? result = await showDialog<String>(
                      context: context,
                      builder: (BuildContext context) {
                        return TextInputDialog(name: 'Enter a new set name');
                      },
                    );
                    spellSet.name = result ?? spellSet.name;
                    onSetUpdate();
                    JsonAccountStrategy()
                        .saveCharacters(AccountManager().characters);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  child: Text(
                    'Rename',
                    style: TextStyle(
                      fontSize: theme.textTheme.bodyMedium!.fontSize,
                      fontFamily: theme.textTheme.bodyMedium!.fontFamily,
                    ),
                  ),
                ),
                ElevatedButton(
                  //* Delete
                  onPressed: () {
                    AccountManager().selectedCharacter.removeSet(spellSet);
                    onSetUpdate();
                    JsonAccountStrategy()
                        .saveCharacters(AccountManager().characters);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      fontSize: theme.textTheme.bodyMedium!.fontSize,
                      fontFamily: theme.textTheme.bodyMedium!.fontFamily,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
