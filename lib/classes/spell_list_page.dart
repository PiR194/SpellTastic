import 'package:code/classes/dbhelper.dart';
import 'package:code/classes/spell.dart';
import 'package:code/classes/spell__search_delegate_page.dart';
import 'package:code/classes/spell_detail_page.dart';
import 'package:code/data/sqlite_data_strategy.dart';
import 'package:flutter/material.dart';
import '../data/i_data_strategy.dart';


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
    //List<Spell> spells = await dbHelper.getSpells();
    var spells = SQLiteDataStrategy.getInstance().loadSpells();
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
            showSearch(context: context, delegate: SpellSearchDelegate(spells_list));
          },
        ),
        PopupMenuButton<OrderOption>(
            onSelected: (value) {
              setState(() {
                currentOrder = value;
                if (currentOrder == OrderOption.asc) {
                  spells_list.sort((toto, tata) => toto.name.compareTo(tata.name));
                } else {
                  spells_list.sort((toto, tata) => tata.name.compareTo(toto.name));
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
            leading: const Image(
              image: AssetImage('assets/src/Sprite-SlimeGHallow.png'),
              height: 150,
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
                  builder: (context) => SpellDetailsPage(spell: spells_list[index]),
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
                      '${spells_list[index].name} ${spells_list[index].school}'),
                );
              })),
    );
  } */
}
