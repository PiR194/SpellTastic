import '../models/spell.dart';
import '../data/sqlite_data_strategy.dart';
import 'package:flutter/material.dart';
import '../data/i_data_strategy.dart';

List<Spell> spells_list = [];

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
                      '${spells_list[index].getName.toString()} ${spells_list[index].getSchool.toString()}'),
                );
              })),
    );
  }
}
