import 'package:flutter/material.dart';
import '../../model/spell.dart';

class StatTable extends StatelessWidget {
  Spell spell;
  StatTable({super.key, required this.spell});

  @override
  Widget build(BuildContext context) {

    //print("RANGE : ${spell.area}");


    //? tenter une liste de 3-uplet avec le spell.valeur, le string de la valeur et l'icon ?
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

  if (spell.range != null && spell.range.trim() != ''){
    dataRows.add(DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.redo),
                  Text("\t Range"),
                ],
              )
            ),
            DataCell(Text(spell.range.toString())),
          ]),);
  }

  if (spell.area != null && spell.area.trim() != ''){
    dataRows.add(DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.crisis_alert),
                  Text("\t Area"),
                ],
              )
            ),
            DataCell(Text(spell.area.toString())),
          ]),);
  }

  if (spell.spellResistance != null && spell.spellResistance.trim() != ''){
    dataRows.add(DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.token),
                  Text("\t Spell Resistance"),
                ],
              )
            ),
            DataCell(Text(spell.spellResistance.toString())),
          ]),);
  }

  if (spell.savingThrow != null && spell.savingThrow.trim() != ''){
    dataRows.add(DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.savings),
                  Text("\t Saving Throw"),
                ],
              )
            ),
            DataCell(Text(spell.savingThrow.toString())),
          ]),);
  }

  if (spell.effect != null && spell.effect.trim() != ''){
    dataRows.add(DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.science),
                  Text("\t Effect"),
                ],
              )
            ),
            DataCell(Text(spell.effect.toString())),
          ]),);
  }

  if (spell.school != null && spell.school.trim() != ''){
    dataRows.add(DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.school),
                  Text("\t School"),
                ],
              )
            ),
            DataCell(Text(spell.school.toString())),
          ]),);
  }

  if (spell.components != null && spell.components.trim() != ''){
    dataRows.add(DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.smart_button),
                  Text("\t Components"),
                ],
              )
            ),
            DataCell(Text(spell.components.toString())),
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
