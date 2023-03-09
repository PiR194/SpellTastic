import '../model/CharacterClass.dart';
import '../model/spell.dart';
import './spell__search_delegate_page.dart';
import './spell_detail_page.dart';
import '../data/sqlite_data_strategy.dart';
import 'package:flutter/material.dart';
import '../data/dbhelper.dart';
import 'dart:io' show Platform;

//TODO ajouter les filtres sur les sorts
//? filtrer les listes pour que un personnage vois que ces sort dispo (eviter les "null" dans l'affichage)
//! Penser a supprimer se "mini stub", et de le remplacer par le binding des pages
import '../model/character.dart';

//Character dum = Character("dummy", "Bar", 10);

List<Spell> spells_list = [];

enum OrderOption {
  asc,
  desc,
  Lvlasc,
  Lvldesc,
  _default,
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

  void getData() async {
    List<Spell> spells;
    if (Platform.isAndroid) {
      var dbHelper = DbHelper();
      spells = await dbHelper.getSpells();
    } else {
      //await SQLiteDataStrategy.init();
      var data = await SQLiteDataStrategy.getInstance();
      spells = await data.loadSpells();
    }
    print("size:  ${spells.length}");
    setState(() {
      spells_list = spells;
      // .where((spell) => spell.getLevelByClass(character.cclass) != null)
      // .toList();
      print(spells_list.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste de sorts'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context, delegate: SpellSearchDelegate(spells_list));
            },
          ),
          PopupMenuButton<OrderOption>(
            onSelected: (value) {
              setState(() {
                currentOrder = value;
                if (currentOrder == OrderOption.asc) {
                  spells_list
                      .sort((toto, tata) => toto.name.compareTo(tata.name));
                } else if (currentOrder == OrderOption.desc) {
                  spells_list
                      .sort((toto, tata) => tata.name.compareTo(toto.name));
                } else if (currentOrder == OrderOption.Lvlasc) {
                  spells_list.sort((toto, tata) =>
                      (toto.getLevelByClass(character.cclass) ?? 0).compareTo(
                          tata.getLevelByClass(character.cclass) ?? 0));
                } else if (currentOrder == OrderOption.Lvldesc) {
                  spells_list.sort((toto, tata) =>
                      (tata.getLevelByClass(character.cclass) ?? 0).compareTo(
                          toto.getLevelByClass(character.cclass) ?? 0));
                }
              });
            },
            icon: const Icon(Icons.filter_alt),
            itemBuilder: (context) => [
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
      body: ListView.builder(
        itemExtent: 50,
        cacheExtent: 2,
        itemCount: spells_list.length,
        itemBuilder: (context, index) {
          Color backgroundColor = Colors.white;
          if (spells_list[index].getLevelByClass(character.cclass)?.isEven ??
              false) {
            if (currentOrder == OrderOption.Lvlasc ||
                currentOrder == OrderOption.Lvldesc) {
              backgroundColor = const Color.fromARGB(255, 209, 214, 216);
            }
          }
          // spells_list[index].GetLevelByClass(character.cclass)?.isEven ??
          //         false
          //     ? const Color.fromARGB(255, 209, 214, 216)
          //     : Colors.white;
          return ListTile(
            leading: ExcludeSemantics(
              child: CircleAvatar(
                  child: Text(spells_list[index]
                      .getLevelByClass(character.cclass)
                      .toString())),
            ),
            tileColor: backgroundColor,
            title: Text(spells_list[index].name),
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
