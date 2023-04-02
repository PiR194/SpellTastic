//* Package *//
import 'package:code/src/data/json_account_strategy.dart';
import 'package:code/src/model/account_manager.dart';
import 'package:code/src/view/widgets/StatTable.dart';
import 'package:flutter/cupertino.dart';
import '../model/spell.dart';
import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter_html/style.dart';

//* Model *//
import '../model/spell.dart';

//* Widgets *//
import './widgets/tableSpellWidget.dart';

class SpellDetailsPage extends StatelessWidget {
  final Spell spell;

  SpellDetailsPage({required this.spell});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            spell.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'Anaktoria',
                fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.star),
              onPressed: () {
                AccountManager().favoriteSpells.addSpell(spell);
                JsonAccountStrategy()
                    .saveFavorites(AccountManager().favoriteSpells);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: const [
                        Icon(Icons.check, color: Colors.green),
                        SizedBox(width: 8),
                        Text("Added to favorites!"),
                      ],
                    ),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
          ],
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 241, 117, 15),
        ),
        body: SingleChildScrollView(
            child: Wrap(
          spacing: screenWidth * 0.05,
          runSpacing: screenHeight * 0.05,
          children: [
            Center(
                child: Container(
              //* Description
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: StatTable(spell: spell),
            )),
            Center(
                child: Container(
              //* Description
              constraints: BoxConstraints(maxWidth: 1000),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: RichText(
                text: TextSpan(
                  text: 'Description du sort : \n',
                  style: Theme.of(context).textTheme.headlineLarge,
                  children: <TextSpan>[
                    TextSpan(
                      text: '',
                      children: [
                        WidgetSpan(
                          child: HtmlWidget(spell.description,
                              textStyle:
                                  Theme.of(context).textTheme.bodyMedium),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
            Center(
                child: Container(
              padding: EdgeInsets.all(16.0),
              width: screenWidth / 3,
              constraints: BoxConstraints(minWidth: 500),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Wrap(
                  //*Wrap de toute la table
                  spacing: screenWidth * 0.05,
                  runSpacing: screenHeight * 0.05,
                  children: [
                    Center(
                        child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          )),
                      child: Text(
                        "Table des classes",
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    )),
                    TableWidget(spell: spell),
                    //const SizedBox(height: 16.0),
                  ]),
            ))
          ],
        )));
  }
}
