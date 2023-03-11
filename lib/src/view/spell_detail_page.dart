//* Package *//
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
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 241, 117, 15),
        ),
        body: SingleChildScrollView(
          child:Wrap( //MAin wrap
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 100.0,
                  right: 100.0,
                ),
                child:Container( //* Description
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
                              child: HtmlWidget(
                                spell.description,
                                textStyle: Theme.of(context).textTheme.bodyMedium
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 15.0,
                  left: 100.0,
                  right: 100.0,
                ),
                child: Center(
                  child: Container( //* Description
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
                    child: StatTable(spell : spell),
                  )
                )
              ),

              Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    bottom: 15.0,
                    left: 100.0,
                    right: 100.0,
                  ),
                  child:Container(
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
                    child: Wrap( //*Wrap de toute la table
                      children: [
                        Center(
                          child:Container(
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              )
                            ),
                            child:Text(
                                    "Table des classes",
                                    style:Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                            )
                        ),
                        TableWidget(spell : spell),
                        const SizedBox(height: 16.0),
                      ]  
                    ),
                  )
                )
              ],
            )
          )
    );
  }
}
