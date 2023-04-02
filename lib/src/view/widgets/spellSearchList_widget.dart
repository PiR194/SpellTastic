import 'package:code/src/model/character_class.dart';
import 'package:code/src/view/widgets/pop-ups/alert_popup.dart';

import '../../data/json_account_strategy.dart';
import '../../model/account_manager.dart';
import '../../model/spell.dart';
import '../dynamic_spell_list_page.dart';
import '../set_display.dart';
import '../spell_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpellSearchList extends StatelessWidget {
  final List<Spell> spells;
  final String query;
  final bool isAddable;
  final String nameSet;
  Function added;

  SpellSearchList(
      {super.key,
      required this.spells,
      required this.query,
      required this.added,
      this.isAddable = false,
      this.nameSet = ""});

  /// this is trash but no time for better:

  void addToSet(BuildContext context, int index) {
    added();
    AccountManager()
        .selectedCharacter
        .sets
        .where((set) => set.name == nameSet)
        .first
        .spells
        .add(spells[index].copy());
    JsonAccountStrategy().saveCharacters(AccountManager().characters);
  }

  void addToKnownSpell(BuildContext context, int index) {
    added();
    AccountManager()
        .selectedCharacter
        .knownSpells
        .spells
        .add(spells[index].copy());
    JsonAccountStrategy().saveCharacters(AccountManager().characters);
  }

  // =====

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.builder(
      itemCount: spells.length,
      itemBuilder: (context, index) {
        //* affichage du mot dans la description lors de la recherche
        List<String> words = spells[index]
            .description
            .replaceAll(RegExp(r'[^\w\s]+'), ' ')
            .split(" ");
        int jndex = words.indexOf(query);
        String twoPreviousWord = "";
        String twoNextWord = "";
        String displayQuery;

        //* Assignation mots premiers et suivants.
        if (jndex != -1 && query.trim().isNotEmpty) {
          twoPreviousWord = jndex > 2
              ? "${words[jndex - 2]}  ${words[jndex - 1]}"
              : (jndex == 1 ? words[jndex - 1] : "");
          twoNextWord = jndex < words.length - 3 && jndex != words.length - 2
              ? "${words[jndex + 1]}  ${words[jndex + 2]}"
              : (jndex == words.length - 2 ? words[jndex + 1] : "");
          twoPreviousWord = "...$twoPreviousWord";
          twoNextWord = "$twoNextWord...";
        }
        twoNextWord == "" && twoPreviousWord == ""
            ? displayQuery = ""
            : displayQuery = query;

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
                  fontFamily:
                      Theme.of(context).textTheme.titleLarge!.fontFamily,
                ),
                children: [
                  TextSpan(
                    text: "${spells[index].name} ",
                  ),
                  TextSpan(
                      text: '    $twoPreviousWord ',
                      style: Theme.of(context).textTheme.titleSmall),
                  TextSpan(
                      text: ' $displayQuery ',
                      style: const TextStyle(
                          fontWeight:
                              FontWeight.bold)), //* mot recherché en gras
                  TextSpan(
                      text: ' $twoNextWord',
                      style: Theme.of(context).textTheme.titleSmall),
                ]),
          ),
          trailing: isAddable
              ? IconButton(
                  icon: Icon(Icons.add_box_outlined),
                  onPressed: () async {
                    if (nameSet == "Known Spells") {
                      addToKnownSpell(context, index);
                    } else {
                      if (AccountManager()
                              .selectedCharacter
                              .sets
                              .where((set) => set.name == nameSet)
                              .first
                              .spells
                              .where((spell) =>
                                  spell.level[AccountManager()
                                      .selectedCharacter
                                      .characterClass] ==
                                  spells[index].level[AccountManager()
                                      .selectedCharacter
                                      .characterClass])
                              .length >=
                          AccountManager()
                              .selectedCharacter
                              .characterClass
                              .getSpellPerDay()[AccountManager()
                                      .selectedCharacter
                                      .characterClass
                                      .name
                                      .toLowerCase()]![
                                  AccountManager().selectedCharacter.level]!
                              .elementAt(spells[index].level[AccountManager()
                                  .selectedCharacter
                                  .characterClass]!)) {
                        await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AlertPopup(
                                  message:
                                      "Your current character level doesn't allow you to add more spells of this level ");
                            });
                      } else {
                        addToSet(context, index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                const Icon(Icons.check, color: Colors.green),
                                const SizedBox(width: 8),
                                Text("Spell added to ${nameSet}"),
                              ],
                            ),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      }
                    }
                  },
                )
              : null,
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
