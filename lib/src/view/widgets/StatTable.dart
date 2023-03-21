import 'package:flutter/material.dart';
import '../../model/spell.dart';

class StatTable extends StatelessWidget {
  Spell spell;
  StatTable({super.key, required this.spell});

  @override
  Widget build(BuildContext context) {

    //? tenter une liste de 3-uplet avec le spell.valeur, le string de la valeur et l'icon ?
    List<DataRow> dataRows = [];
  if (spell.castingTime != null && spell.castingTime.trim() != '') {
    dataRows.add( DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.timer),
                  Text("\t Casting Time", maxLines: 1, overflow:TextOverflow.fade),
                ],
              )
            ),
            DataCell(Text(spell.castingTime.toString(), maxLines: 1, overflow:TextOverflow.fade)),
          ]),);
  }

  if (spell.duration != null && spell.duration.trim() != '') {
    dataRows.add(DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.timelapse),
                  Text("\t Duration", maxLines: 1, overflow:TextOverflow.fade),
                ],
              )
            ),
            DataCell(Text(spell.duration.toString(), maxLines: 1, overflow:TextOverflow.fade)),
          ]),);
    }

  if (spell.target != null && spell.target.trim() != '') {
    dataRows.add(DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.ads_click),
                  Text("\t Target", maxLines: 1, overflow:TextOverflow.fade),
                ],
              )
            ),
            DataCell(Text(spell.target, maxLines: 1, overflow:TextOverflow.fade)),
          ]),);
    }

  if (spell.range != null && spell.range.trim() != ''){
    dataRows.add(DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.redo),
                  Text("\t Range", maxLines: 1, overflow:TextOverflow.fade),
                ],
              )
            ),
            DataCell(Text(spell.range.toString(), maxLines: 1, overflow:TextOverflow.fade)),
          ]),);
  }

  if (spell.area != null && spell.area.trim() != ''){
    dataRows.add(DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.crisis_alert),
                  Text("\t Area", maxLines: 1, overflow:TextOverflow.fade),
                ],
              )
            ),
            DataCell(Text(spell.area.toString(), maxLines: 1, overflow:TextOverflow.fade)),
          ]),);
  }

  if (spell.spellResistance != null && spell.spellResistance.trim() != ''){
    dataRows.add(DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.token),
                  Text("\t Spell Resistance", maxLines: 1, overflow:TextOverflow.fade),
                ],
              )
            ),
            DataCell(Text(spell.spellResistance.toString(), maxLines: 1, overflow:TextOverflow.fade)),
          ]),);
  }

  if (spell.savingThrow != null && spell.savingThrow.trim() != ''){
    dataRows.add(DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.savings),
                  Text("\t Saving Throw", maxLines: 1, overflow:TextOverflow.fade),
                ],
              )
            ),
            DataCell(Text(spell.savingThrow.toString(), maxLines: 1, overflow:TextOverflow.fade)),
          ]),);
  }

  if (spell.effect != null && spell.effect.trim() != ''){
    dataRows.add(DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.science),
                  Text("\t Effect", maxLines: 1, overflow:TextOverflow.fade),
                ],
              )
            ),
            DataCell(Text(spell.effect.toString(), maxLines: 1, overflow:TextOverflow.fade)),
          ]),);
  }

  if (spell.school != null && spell.school.trim() != ''){
    dataRows.add(DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.school),
                  Text("\t School", maxLines: 1, overflow:TextOverflow.fade),
                ],
              )
            ),
            DataCell(Text(spell.school.toString(), maxLines: 1, overflow:TextOverflow.fade)),
          ]),);
  }

  if (spell.components != null && spell.components.trim() != ''){
    dataRows.add(DataRow(cells: [
            DataCell(
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.smart_button),
                  Text("\t Components", maxLines: 1, overflow:TextOverflow.fade),
                ],
              )
            ),
            DataCell(Text(spell.components.toString(), maxLines: 1, overflow:TextOverflow.fade)),
          ]),);
  }


    return Wrap(
            children: [
              //* Wrap pour possiblement ajouter autre chose avec, comme un titre
              //? tentative d'ajout de ce dernier mais casse le front        
          DataTable(
          columns: [
            DataColumn(label: Text('Statistique',maxLines: 1, overflow:TextOverflow.fade, textAlign: TextAlign.center, style:Theme.of(context).textTheme.titleLarge)),
            DataColumn(label: Text('Valeur', maxLines: 1, overflow:TextOverflow.fade,textAlign: TextAlign.center, style:Theme.of(context).textTheme.titleLarge)),
          ],

          rows: dataRows,
        )
      ]
    );
  }
}
