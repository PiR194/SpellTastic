import 'dart:io';
import 'package:code/src/model/account_manager.dart';
import 'package:code/src/view/widgets/addCharacterWidget.dart';
import 'package:code/src/view/widgets/characterButtonWidget.dart';
import 'package:code/src/view/widgets/displayAllSpellButtonWidget.dart';
import 'package:code/src/view/widgets/spell_display_widget.dart';
import 'package:flutter/material.dart';
import '../data/dbhelper.dart';
import '../data/json_account_strategy.dart';
import '../data/sqlite_data_strategy.dart';
import '../model/spell.dart';
import '../model/spell_set.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SpellSet spells_list = SpellSet("All Spells");

  @override
  void initState() {
    super.initState();
    loadCharacters();
  }

  void getData() async {
    List<Spell> spells;
    if (Platform.isAndroid) {
      var dbHelper = DbHelper();
      spells = await dbHelper.loadSpells();
    } else {
      var data = SQLiteDataStrategy();
      spells = await data.loadSpells();
    }
    spells_list.spells = spells;
    AccountManager().allSpells.spells = spells;

    // Stub data: to be removed
    var stubSet = SpellSet("stubSet");
    stubSet.spells = spells_list.spells.sublist(0, 40);
    AccountManager().characters[0].sets.add(stubSet);
    // stubSet.spells = spells_list.spells.sublist(40, 80);
    // AccountManager().characters[0].knownSpells.spells = stubSet.spells;
  }

  /*
  * This functions load the charactes from the account.json file
  * into AccountManager's character list which accessible throughout
  * the code.
  */
  Future<void> loadCharacters() async {
    print("a");
    final JsonAccountStrategy accountStrategy = JsonAccountStrategy();

    AccountManager().characters = await accountStrategy.loadCharacters();
    print("characters ${AccountManager().characters}");
    getData();
    setState(() {});
  }

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
            fontFamily: theme.textTheme.titleLarge!.fontFamily,
            fontWeight: theme.textTheme.titleLarge!.fontWeight,
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
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: accentColor,
              padding: const EdgeInsets.all(16),
            ),
            child: const Icon(Icons.settings),
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
                  ...AccountManager().characters.map(
                        (character) => CharacterButtonWidget(
                          character: character,
                        ),
                      ),
                  Wrap(
                      spacing: screenWidth * 0.05,
                      runSpacing: screenHeight * 0.02,
                      alignment: WrapAlignment.center,
                      children: [
                        Center(
                          child: SpellDisplayWidget(
                              spellSet: spells_list, isReadonly: true),
                        ),
                      ]),
                ],
              ),
            ),
          )),
    );
  }
}
