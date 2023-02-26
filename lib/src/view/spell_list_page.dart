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
Character dum = Character("dummy", "Bar", 10);



List<Spell> spells_list = [];

enum OrderOption {
  asc,
  desc,
  _default,
}

OrderOption currentOrder = OrderOption.asc;

class SpellListPage extends StatefulWidget {
  @override
  _SpellListPageState createState() => new _SpellListPageState();
}

class _SpellListPageState extends State<SpellListPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    List<Spell> spells;
    if (Platform.isAndroid) {
      var dbHelper = DbHelper();
      spells = await dbHelper.getSpells();
    } else {
      await SQLiteDataStrategy.init();
      spells = SQLiteDataStrategy.getInstance().loadSpells();
    }
    setState(() {
      spells_list = spells;
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
                } else {
                  spells_list
                      .sort((toto, tata) => tata.name.compareTo(toto.name));
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
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: spells_list.length,
        itemBuilder: (context, index) {
          return ListTile(
            //leading: Image.file(File('./src/LuvLimule.png')),
            /*leading: const Image(
              image: AssetImage('assets/src/Sprite-SlimeGHallow.png'),
              height: 150,
            ),*/
            leading: ExcludeSemantics(
                  //child: CircleAvatar(child: Text('$index')), //cercle avec index => numero dans la liste
                  child: CircleAvatar(child: Text(spells_list[index].GetLevelByClass(dum.cclass).toString())),
            ),
            title: Text(spells_list[index].name),
            trailing: const Icon(
              Icons.arrow_forward,
              color: Colors.blueGrey,
              size: 24.0,
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

/* OLD WIDGET VIEW LIST 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spell Names'),
      ),
      body: Container(
          child: ListView.separated(
              separatorBuilder: (context, index) =>
                  const Divider(height: 0.5, color: Colors.black38),
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: spells_list == null ? 0 : spells_list.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                      '${spells_list[index].name} ${spells_list[index].school} ${spells_list[index].source}'),
                );
              })),
    );
  } */
}
