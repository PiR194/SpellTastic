import 'package:code/src/model/account_manager.dart';
import 'package:code/src/view/widgets/addCharacterWidget.dart';
import 'package:code/src/view/widgets/displayAllSpellButtonWidget.dart';
import 'package:flutter/material.dart';
import 'widgets/characterButtonWidget.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final AccountManager accountManager = AccountManager();

    const Color backgroundColor = Color(0xFFEDE7F6);
    const Color accentColor = Color(0xFF9C27B0);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'SPELLTASTIC',
          style: TextStyle(
            color: Colors.black,
            fontSize: 50,
            fontFamily: theme.textTheme.bodyLarge!.fontFamily,
            fontWeight: theme.textTheme.bodyLarge!.fontWeight,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            child: Icon(Icons.settings),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(16),
              primary: accentColor,
            ),
          ),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + kToolbarHeight),
          child: Center(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: screenWidth * 0.05,
                runSpacing: screenHeight * 0.02,
                alignment: WrapAlignment.center,
                children: [
                  AddCharacterWidget(),
                  ...accountManager.characters.map(
                    (character) => CharacterButtonWidget(
                      character: character,
                    ),
                  ),
                  Container(
                    width: screenWidth,
                    child: DisplayAllSpellButtonWidget(),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
