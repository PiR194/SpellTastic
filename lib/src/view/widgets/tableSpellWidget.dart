import 'package:flutter/material.dart';
import '../../model/spell.dart';

class TableWidget extends StatelessWidget {
  Spell spell;
  TableWidget({super.key, required this.spell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Table(
        border: TableBorder.symmetric(
          inside: const BorderSide(
              width: 1.0, 
              color: Colors.grey
            ),
        ),
        children: [
          TableRow(
            children: [
              TableCell(
                child: Text(
                    'Class',
                    style:Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
              ),
              TableCell(
                child: Text(
                    'Niveau',
                    style:Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
              ),
            ],
          ),
          ...spell.GetMapClassLevel().entries.map(
            (entry) => TableRow(
              children: [
                TableCell(
                  child: Text(
                    entry.key,
                    style:Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  child: Text(
                    entry.value.toString(),
                    style:Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
