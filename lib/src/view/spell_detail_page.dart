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
      
      body:Table(
      border: TableBorder.all(),
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
        ... spell.GetMapClassLevel().entries.map(
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
    )
      
      // body: Table(
      //     border: TableBorder.all(),
      //     children: <TableRow>[
      //       TableRow(
      //         children: <Widget> [
      //           Center(
      //             child: Container(
      //               child: Text(spell.id.toString())
      //             ),
      //           ),
      //           Center(
      //             child: Container(
      //               child: Text(spell.components.toString())
      //             ),
      //           ),
      //           Center(
      //             child: Container(
      //               child: Text(spell.level.toString())
      //             ),
      //           )
      //         ]
      //       ),
      //       TableRow(
      //         children: <Widget> [
      //           Container(
      //             height: 64,
      //             width: 128,
      //             color: Color.fromARGB(255, 241, 117, 15),
      //           ),
      //           Center(
      //             child: Container(
      //               child: Text(spell.description)
      //             ),
      //           ),
      //           Container(
      //             height: 64,
      //             width: 128,
      //             color: Color.fromARGB(255, 241, 117, 15),
      //           ),
      //         ]
      //       )
      //     ],
      //   )
    );
  }
}
