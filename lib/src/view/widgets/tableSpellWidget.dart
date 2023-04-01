import 'package:flutter/material.dart';
import '../../model/spell.dart';

class TableWidget extends StatelessWidget {
  Spell spell;
  TableWidget({super.key, required this.spell});

  @override
  Widget build(BuildContext context) {
    List<DataRow> dataRows = [];

    for (var entry in spell.GetMapClassLevel().entries) {
      dataRows.add(DataRow(cells: [
        DataCell(
          Text(entry.key.toString().split(".").last),
        ),
        DataCell(Text(entry.value.toString())),
      ]));
    }

    return Center(
        child: DataTable(
      columns: [
        DataColumn(
            label: Text('Class',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge)),
        DataColumn(
            label: Text('Level',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge)),
      ],
      rows: dataRows,
    )

////* Table original (jouli mais pas besoin clien)
        // Table(
        //   border: TableBorder.symmetric(
        //     inside: const BorderSide(
        //         width: 1.0,
        //         color: Colors.grey
        //       ),
        //   ),
        //   children: [
        //     TableRow(
        //       children: [
        //         TableCell(
        //           child: Text(
        //               'Class',
        //               style:Theme.of(context).textTheme.titleLarge,
        //               textAlign: TextAlign.center,
        //             ),
        //         ),
        //         TableCell(
        //           child: Text(
        //               'Niveau',
        //               style:Theme.of(context).textTheme.titleLarge,
        //               textAlign: TextAlign.center,
        //             ),
        //         ),
        //       ],
        //     ),
        //     ...spell.GetMapClassLevel().entries.map(
        //       (entry) => TableRow(
        //         children: [
        //           TableCell(
        //             child: Text(
        //               entry.key,
        //               style:Theme.of(context).textTheme.bodyLarge,
        //               textAlign: TextAlign.center,
        //             ),
        //           ),
        //           TableCell(
        //             child: Text(
        //               entry.value.toString(),
        //               style:Theme.of(context).textTheme.bodyLarge,
        //               textAlign: TextAlign.center,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
