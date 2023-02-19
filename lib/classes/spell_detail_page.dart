import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpellDetailsPage extends StatelessWidget {
  final Map<String, dynamic> spell;

  SpellDetailsPage({required this.spell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(spell["name"]),
        backgroundColor: Color.fromARGB(255, 241, 117, 15),
      ),
      body: Center(
        child: Text(spell["description"]),
      ),
    );
  }
}

