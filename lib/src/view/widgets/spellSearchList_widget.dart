import '../../model/spell.dart';
import '../spell_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpellSearchList extends StatelessWidget {
  final List<Spell> spells;

  final String query;
  SpellSearchList({required this.spells,required this.query});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);


    return ListView.builder(
      itemCount: spells.length,
      itemBuilder: (context, index) {
        
        //* affichage du mot dans la description lors de la recherche 
        List<String> words = spells[index].description.replaceAll(RegExp(r'[^\w\s]+'), ' ').split(" ");
        int jndex = words.indexOf(query);
        String twoPreviousWord = "";
        String twoNextWord = "";
        String displayQuery;
        
        //* Assignation mots premiers et suivants.
        if (jndex != -1 && query.trim().isNotEmpty) {
          twoPreviousWord = jndex > 2 ? "${words[jndex-2]}  ${words[jndex-1]}" : (jndex == 1 ? words[jndex-1] : "");
          twoNextWord = jndex < words.length-3 && jndex != words.length-2? "${words[jndex+1]}  ${words[jndex+2]}" : (jndex == words.length-2 ? words[jndex+1] : "");
          twoPreviousWord = "...$twoPreviousWord";
          twoNextWord = "$twoNextWord...";
        }
        twoNextWord == "" && twoPreviousWord == "" ? displayQuery = "" : displayQuery = query;
        
        //TODO
        //? essayer de trier pour mettre en valeur les recherches sur noms plutot que par description.
        //? essayer de voir pour les concaténations de mot
        //! comment faire pour les cas ou le mot est présent plusieurs fois ?

        return ListTile(
          title: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                  fontFamily: Theme.of(context).textTheme.titleLarge!.fontFamily,
                ),
                children: [
                  TextSpan(text:"${spells[index].name} ",),
                  TextSpan(text:'    $twoPreviousWord ', style: Theme.of(context).textTheme.titleSmall),
                  TextSpan(text: ' $displayQuery ', style: const TextStyle(fontWeight: FontWeight.bold)), //* mot recherché en gras
                  TextSpan(text: ' $twoNextWord', style: Theme.of(context).textTheme.titleSmall),
                ]
              ),
            ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SpellDetailsPage(spell: spells[index]),
              ),
            );
          },
        );
      },
    );
  }
}
