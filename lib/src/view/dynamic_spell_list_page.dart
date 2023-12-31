/*
* this class takes a list of spells and 
* diplays them our a SpellListView
*/

import 'dart:ffi';

import 'package:code/src/model/spell_set.dart';
import 'package:code/src/view/widgets/add_spells_widget.dart';
import 'package:flutter/material.dart';
import '../model/character_class.dart';
import 'spell__search_delegate_page.dart';
import 'spell_detail_page.dart';
import 'spell_list_page.dart';

class DynamicSpellListPage extends StatefulWidget {
  final SpellSet spellSet; // change character knownSpells to spellset
  final CharacterClass characterClass;
  final bool isReadonly;

  const DynamicSpellListPage(
      {super.key,
      required this.spellSet,
      required this.characterClass,
      required this.isReadonly});

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _DynamicSpellListPage(
      spellSet: spellSet,
      characterClass: characterClass,
      isReadonly: isReadonly);
}

class _DynamicSpellListPage extends State<DynamicSpellListPage> {
  _DynamicSpellListPage(
      {required this.spellSet,
      required this.characterClass,
      required this.isReadonly});
  final SpellSet spellSet;
  final CharacterClass characterClass;
  final bool isReadonly;

  @override
  Widget build(BuildContext context) {
    // propreties for responsivity / theme
    final theme = Theme.of(context);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      /**
       * APP BAR: SEARCH, SORT, FILTER
       */
      appBar: AppBar(
        title: Text(spellSet.name),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              //Appel de la fonction de recherche
              showSearch(
                  context: context,
                  delegate: SpellSearchDelegate(spellSet.spells));
            },
          ),
          if (!isReadonly) AddSpellWidget(spellSet: spellSet),
          PopupMenuButton<OrderOption>(
            //Menu d'option de tri
            onSelected: (value) {
              switch (value) {
                case OrderOption.asc:
                  {
                    //tri ascendant
                    spellSet.spells.sort(
                        (spell1, spell2) => spell1.name.compareTo(spell2.name));
                  }
                  break;

                case OrderOption.desc:
                  {
                    //tri descendant
                    spellSet.spells.sort(
                        (spell1, spell2) => spell2.name.compareTo(spell1.name));
                  }
                  break;

                case OrderOption.Lvlasc:
                  {
                    //tri par niveaux ascendant
                    spellSet.spells.sort((spell1, spell2) =>
                        (spell1.GetLevelByClass(characterClass) ?? 0).compareTo(
                            spell2.GetLevelByClass(characterClass) ?? 0));
                  }
                  break;

                case OrderOption.Lvldesc:
                  {
                    //tri par niveaux descendant
                    spellSet.spells.sort((spell1, spell2) =>
                        (spell2.GetLevelByClass(characterClass) ?? 0).compareTo(
                            spell1.GetLevelByClass(characterClass) ?? 0));
                  }
                  break;
              }
            },
            icon: const Icon(Icons.filter_alt),
            itemBuilder: (context) => [
              //Option du menu de tri
              const PopupMenuItem(
                value: OrderOption.asc,
                child: Text('Croissant'),
              ),
              const PopupMenuItem(
                value: OrderOption.desc,
                child: Text('Décroissant'),
              ),
              const PopupMenuItem(
                value: OrderOption.Lvlasc,
                child: Text('Level Croissant'),
              ),
              const PopupMenuItem(
                value: OrderOption.Lvldesc,
                child: Text('Level Décroissant'),
              ),
            ],
          ),
        ],
      ),
      //----------------------------------------------

      /**
       * BODY: SPELL LIST
       */
      body: ListView.builder(
        itemExtent: 50,
        cacheExtent: 2,
        itemCount: spellSet.spells.length,
        itemBuilder: (context, index) {
          //Coloration des lignes de la liste
          Color backgroundColor = Colors.white;
          if (spellSet.spells[index].GetLevelByClass(characterClass)?.isEven ??
              false) {
            if (currentOrder == OrderOption.Lvlasc ||
                currentOrder == OrderOption.Lvldesc) {
              backgroundColor = const Color.fromARGB(255, 209, 214, 216);
            }
          }
          return ListTile(
            //Structure de chaque ligne (=> ListTile)
            tileColor: backgroundColor,
            title: RichText(
              text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                    fontFamily:
                        Theme.of(context).textTheme.titleLarge!.fontFamily,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "${spellSet.spells[index].name} ${spellSet.spells[index].GetLevelByClass(characterClass)}",
                    ),
                    //? Option avec les 7 premiers mots
                    TextSpan(
                        text:
                            '     ${spellSet.spells[index].description.split(' ').take(7).join(' ')}...',
                        style: Theme.of(context).textTheme.titleSmall)

                    //? Option avec les 35 premiers caractères ?
                    //TextSpan(text:'${spells_list[index].description.substring(0,35)}...', style: Theme.of(context).textTheme.titleSmall)

                    // TextSpan(text:'\t ${spells_list[index].description.substring(0,
                    //   MediaQuery.of(context).size.width.toInt() - '${spells_list[index].name} ${spells_list[index].GetLevelByClass(character.cclass)}) ...'.length
                    // )}...', style: Theme.of(context).textTheme.titleSmall)
                  ]),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SpellDetailsPage(spell: spellSet.spells[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
