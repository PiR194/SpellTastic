import '../model/spell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpellDetailsPage extends StatelessWidget {
  final Spell spell;

  SpellDetailsPage({required this.spell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(spell.name),
        backgroundColor: Color.fromARGB(255, 241, 117, 15),
      ),
      // body: Center(
      //   child: Text(spell.description),
      // ),
      
      body: Padding(
        padding: EdgeInsets.all(50.0),
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
          child: Table(
            border: TableBorder.symmetric(
              inside: BorderSide(width: 1.0, color: Colors.grey),
              outside: BorderSide(width: 1.0, color: Colors.grey),
            ),
            children: [
              const TableRow(
                children: [
                  TableCell(
                    child: Text('Class'),
                  ),
                  TableCell(
                    child: Text('Niveau'),
                  ),
                ],
              ),
              ...spell.GetMapClassLevel().entries.map(
                (entry) => TableRow(
                  children: [
                    TableCell(
                      child: Text(entry.key),
                    ),
                    TableCell(
                      child: Text(entry.value.toString()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
