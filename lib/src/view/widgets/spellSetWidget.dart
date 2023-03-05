import 'package:flutter/material.dart';

import '../spell_detail_page.dart';

class SpellSetWidget extends StatelessWidget {
  String level;
  SpellSetWidget({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LEVEL $level'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemExtent: 50,
        cacheExtent: 2,
        itemCount: 30,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("spell"),
            onTap: () {},
          );
        },
      ),
    );
  }
}
