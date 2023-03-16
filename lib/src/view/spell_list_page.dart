import '../model/character_class.dart';
import '../model/spell.dart';
import './spell__search_delegate_page.dart';
import './spell_detail_page.dart';
import '../data/sqlite_data_strategy.dart';
import 'package:flutter/material.dart';
import '../data/dbhelper.dart';
import 'dart:io' show Platform;

//TODO ajouter d'autres filtres sur les sorts ?

import '../model/character.dart';

List<Spell> spells_list = [];

//Option de tri
enum OrderOption {
  asc,
  desc,
  Lvlasc,
  Lvldesc,
  //_default,
}

OrderOption currentOrder = OrderOption.asc;

class SpellListPage extends StatefulWidget {
  const SpellListPage({super.key, required this.character});
  final Character character;

  @override
  State<SpellListPage> createState() => _SpellListPage(character: character);
}

class _SpellListPage extends State<SpellListPage> {
  _SpellListPage({required this.character});
  Character character;

  @override
  void initState() {
    character = widget.character;
    super.initState();
    getData();
  }

  //Chargement des données
  void getData() async {
    List<Spell> spells;
    if (Platform.isAndroid) {
      var dbHelper = DbHelper();
      spells = await dbHelper.loadSpells();
    } else {
      //await SQLiteDataStrategy.init();
      var data = SQLiteDataStrategy();
      spells = await data.loadSpells();
    }
    //print("size:  ${spells.length}");
    setState(() {
      spells_list = spells
          .where((spell) => spell.GetLevelByClass(character.cclass) != null)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste de sorts'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              //Appel de la fonction de recherche
              showSearch(
                  context: context, delegate: SpellSearchDelegate(spells_list));
            },
          ),
          PopupMenuButton<OrderOption>(
            //Menu d'option de tri
            onSelected: (value) {
              setState(() {
                switch (value) {
                  case OrderOption.asc:
                    {
                      //tri ascendant
                      spells_list.sort((spell1, spell2) =>
                          spell1.name.compareTo(spell2.name));
                    }
                    break;

                  case OrderOption.desc:
                    {
                      //tri descendant
                      spells_list.sort((spell1, spell2) =>
                          spell2.name.compareTo(spell1.name));
                    }
                    break;

                  case OrderOption.Lvlasc:
                    {
                      //tri par niveaux ascendant
                      spells_list.sort((spell1, spell2) =>
                          (spell1.GetLevelByClass(character.cclass) ?? 0)
                              .compareTo(
                                  spell2.GetLevelByClass(character.cclass) ??
                                      0));
                    }
                    break;

                  case OrderOption.Lvldesc:
                    {
                      //tri par niveaux descendant
                      spells_list.sort((spell1, spell2) =>
                          (spell2.GetLevelByClass(character.cclass) ?? 0)
                              .compareTo(
                                  spell1.GetLevelByClass(character.cclass) ??
                                      0));
                    }
                    break;
                }
              });
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
      // body: ListView.builder(
      //   itemCount: spells_list.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return ListTile(
      //       title: Text('${spells_list[index].name} (niveau ${spells_list[index].GetLevelByClass(character.cclass)})'),
      //       subtitle: Text('${spells_list[index].description.substring(0, 20)}...'),
      //     );
      //   },
      // )

      // body:ListView.builder(
      //   itemCount: spells_list.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     // Déterminer le nombre de caractères à afficher
      //     final maxChars = MediaQuery.of(context).size.width.toInt() -
      //         '${spells_list[index].name} (niveau ${spells_list[index].GetLevelByClass(character.cclass)}) ...'.length;
      //     // Extraire les premiers caractères de la description
      //     final desc = spells_list[index].description.substring(0, maxChars);
      //     // Ajouter "..." à la fin si la description est plus longue que maxChars
      //     final displayDesc = spells_list[index].description.length > maxChars ? '$desc...' : desc;
      //     return ListTile(
      //       title: Text('${spells_list[index].name} (niveau ${spells_list[index].GetLevelByClass(character.cclass)})'),
      //       subtitle: Text(displayDesc),
      //     );
      //   },
      // )

      body: ListView.builder(
        itemExtent: 50,
        cacheExtent: 2,
        itemCount: spells_list.length,
        itemBuilder: (context, index) {
          //Coloration des lignes de la liste
          Color backgroundColor = Colors.white;
          if (spells_list[index].GetLevelByClass(character.cclass)?.isEven ??
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
                          "${spells_list[index].name} ${spells_list[index].GetLevelByClass(character.cclass)}",
                    ),
                    //? Option avec les 7 premiers mots
                    TextSpan(
                        text:
                            '     ${spells_list[index].description.split(' ').take(7).join(' ')}...',
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
                      SpellDetailsPage(spell: spells_list[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
