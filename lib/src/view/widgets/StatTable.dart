import 'package:flutter/material.dart';
import '../../model/spell.dart';

class StatTable extends StatelessWidget {
  Spell spell;
  StatTable({super.key, required this.spell});

  @override
  Widget build(BuildContext context) {

    //print("RANGE : ${spell.area}");
    List<DataRow> dataRows = [];
  if (spell.castingTime != null && spell.castingTime.trim() != '') {
    dataRows.add( DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.timer),
                  Text("\t Casting Time"),
                ],
              )
            ),
            DataCell(Text(spell.castingTime.toString())),
          ]),);
  }

  if (spell.duration != null && spell.duration.trim() != '') {
    dataRows.add(DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.timelapse),
                  Text("\t Duration"),
                ],
              )
            ),
            DataCell(Text(spell.duration.toString())),
          ]),);
    }

  if (spell.target != null && spell.target.trim() != '') {
dataRows.add(DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.ads_click),
                  Text("\t Target"),
                ],
              )
            ),
            DataCell(Text(spell.target)),
          ]),);
    }

  if (spell.area != null && spell.area.trim() != ''){
    dataRows.add(DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.crisis_alert),
                  Text("\t Range"),
                ],
              )
            ),
            DataCell(Text(spell.area.toString())),
          ]),);
  }

    return Wrap(
            children: [
              //* Wrap pour possiblement ajouter autre chose avec, comme un titre
              //? tentative d'ajout de ce dernier mais casse le front
        DataTable(
          columns: [
            DataColumn(label: Text('Statistique', textAlign: TextAlign.center, style:Theme.of(context).textTheme.titleLarge)),
            DataColumn(label: Text('Valeur', textAlign: TextAlign.center, style:Theme.of(context).textTheme.titleLarge)),
          ],

          rows: dataRows,
        )
      ]
    );
  }
}
