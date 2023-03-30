import '../../model/spell.dart';
import '../spell_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

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
        int occur = (words.where((e) => e == query)).length;
        String twoPreviousWord = "";
        String twoNextWord = "";
        String displayQuery;
        

        
        
        if (occur < 2){
          //* Assignation mots premiers et suivants.
          if (jndex != -1 && query.trim().isNotEmpty) {
            twoPreviousWord = jndex > 2 ? "${words[jndex-2]}  ${words[jndex-1]}" : (jndex == 1 ? words[jndex-1] : "");
            twoNextWord = jndex < words.length-3 && jndex != words.length-2? "${words[jndex+1]}  ${words[jndex+2]}" : (jndex == words.length-2 ? words[jndex+1] : "");
            twoPreviousWord = "...$twoPreviousWord";
            twoNextWord = "$twoNextWord...";
          }
          twoNextWord == "" && twoPreviousWord == "" ? displayQuery = "" : displayQuery = query;
        }
        else {
          query=="" ? displayQuery = query : displayQuery = "($occur occurences)";
        }
        
        
        //TODO
        //? essayer de trier pour mettre en valeur les recherches sur noms plutot que par description.
        //? essayer de voir pour les concaténations de mot
        //! comment faire pour les cas ou le mot est présent plusieurs fois ?

        return ListTile(
          
          title:RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                  fontFamily: Theme.of(context).textTheme.titleLarge!.fontFamily,
                ),
                children: [
                  WidgetSpan(
                    child: HtmlWidget(
                      "${spells[index].name} ",
                      textStyle: Theme.of(context).textTheme.titleLarge,
                    )),
                  WidgetSpan(
                    child: HtmlWidget(
                      '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  $twoPreviousWord ',
                      textStyle :Theme.of(context).textTheme.titleSmall
                    )),
                  WidgetSpan(
                    child: HtmlWidget(
                      '&nbsp; $displayQuery &nbsp;',
                      textStyle : TextStyle(fontWeight: FontWeight.bold, fontSize:Theme.of(context).textTheme.titleLarge!.fontSize)
                    )),
                  WidgetSpan(
                    child: HtmlWidget(
                      ' $twoNextWord',
                      textStyle : Theme.of(context).textTheme.titleSmall
                    )),
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
