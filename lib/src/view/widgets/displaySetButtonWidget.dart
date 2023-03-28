import 'package:code/src/model/spell_set.dart';

import '../../model/account_manager.dart';
import '../home.dart';
import 'package:flutter/material.dart';

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
          primary: accentColor,
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
          Navigator.pushNamed(context, '/setdisplay');
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
                  onPressed: () {
                    // Modifier le set (à implémenter)
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
                  onPressed: () {
                    // Modifier le set (à implémenter)
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  child: Text(
                    'Modify',
                    style: TextStyle(
                      fontSize: theme.textTheme.bodyMedium!.fontSize,
                      fontFamily: theme.textTheme.bodyMedium!.fontFamily,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    AccountManager().selectedCharacter.removeSet(spellSet);
                    onSetUpdate();
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
