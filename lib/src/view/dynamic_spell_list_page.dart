/*
* this class takes a list of spells and 
* diplays them in our a SpellListView
*/
import 'package:code/src/model/account_manager.dart';
import 'package:code/src/model/spell_set.dart';
import 'package:code/src/view/set_display.dart';
import 'package:code/src/view/widgets/add_spells_widget.dart';
import 'package:code/src/view/widgets/pop-ups/alert_popup.dart';
import 'package:flutter/material.dart';
import '../data/json_account_strategy.dart';
import '../model/character_class.dart';
import 'spell__search_delegate_page.dart';
import 'spell_detail_page.dart';
import 'spell_list_page.dart';

class DynamicSpellListPage extends StatefulWidget {
  final SpellSet spellSet;
  final CharacterClass characterClass;
  final bool isReadonly;
  final bool isAddable;
  final String nameSet;

  const DynamicSpellListPage({
    Key? key,
    required this.spellSet,
    required this.characterClass,
    required this.isReadonly,
    required this.isAddable,
    this.nameSet = "",
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _DynamicSpellListPage(
        spellSet: spellSet,
        characterClass: characterClass,
        isReadonly: isReadonly,
        isAddable: isAddable,
        nameSet: nameSet,
      );
}

class _DynamicSpellListPage extends State<DynamicSpellListPage> {
  _DynamicSpellListPage({
    required this.spellSet,
    required this.characterClass,
    required this.isReadonly,
    required this.isAddable,
    this.nameSet = "",
  }) : isAdding = List.generate(spellSet.spells.length, (_) => false);

  SpellSet spellSet;
  final CharacterClass characterClass;
  final bool isReadonly;
  final bool isAddable;
  bool removeMode = false;
  final String nameSet;
  bool wasAdded = false;
  List<bool> isAdding;

  set wasAddedSet(bool wasAdded) {
    wasAdded = wasAdded;
  }

  @override
  Widget build(BuildContext context) {
    // propreties for responsivity / theme
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
        onWillPop: () async {
          if (nameSet == "Known Spells" && wasAdded == true) {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => DynamicSpellListPage(
                      spellSet: AccountManager().selectedCharacter.knownSpells,
                      characterClass:
                          AccountManager().selectedCharacter.characterClass,
                      isReadonly: false,
                      isAddable: false)),
            );
          } else if (wasAdded == true) {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => SetDisplay(
                      fullSet: AccountManager()
                          .selectedCharacter
                          .sets
                          .where((set) => set.name == nameSet)
                          .first,
                      isModify: true)),
            );
          } else {
            Navigator.pop(context);
          }
          return true;
        },
        child: Scaffold(
          /**
       * APP BAR: SEARCH, SORT, FILTER
       */
          appBar: AppBar(
            title: Text(spellSet.name),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  //Appel de la fonction de recherche
                  showSearch(
                      context: context,
                      delegate: SpellSearchDelegate(
                          spellSet.spells, searchAdded,
                          isAddable: isAddable, nameSet: nameSet));
                },
              ),
              Visibility(
                  visible: spellSet.name == 'Known Spells' && !isReadonly,
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      removeMode = !removeMode;
                      setState(() {
                        //update the view
                      });
                    },
                  )),
              if (!isReadonly)
                AddSpellWidget(
                  // known spells was given directly beacause only known spells will
                  // have this add button for now, idally this would be a variable
                  spellSet: spellSet, nameSet: "Known Spells",
                ),
              PopupMenuButton<OrderOption>(
                //Menu d'option de tri
                onSelected: (value) {
                  switch (value) {
                    case OrderOption.asc:
                      {
                        //tri ascendant
                        spellSet.spells.sort((spell1, spell2) =>
                            spell1.name.compareTo(spell2.name));
                      }
                      break;

                    case OrderOption.desc:
                      {
                        //tri descendant
                        spellSet.spells.sort((spell1, spell2) =>
                            spell2.name.compareTo(spell1.name));
                      }
                      break;

                    case OrderOption.Lvlasc:
                      {
                        //tri par niveaux ascendant
                        // spellSet.spells.sort((spell1, spell2) =>
                        //     (spell1.GetLevelByClass(characterClass) ?? 0).compareTo(
                        //         spell2.GetLevelByClass(characterClass) ?? 0));
                        spellSet.spells.sort((spell1, spell2) =>
                            (spell1.GetMedianClassLevel())
                                .compareTo(spell2.GetMedianClassLevel()));
                      }
                      break;

                    case OrderOption.Lvldesc:
                      {
                        //tri par niveaux descendant
                        spellSet.spells.sort((spell1, spell2) =>
                            (spell2.GetMedianClassLevel())
                                .compareTo(spell1.GetMedianClassLevel()));
                      }
                      break;
                  }
                  setState(() {});
                },
                icon: const Icon(Icons.filter_alt),
                itemBuilder: (context) => [
                  //Option du menu de tri
                  const PopupMenuItem(
                    value: OrderOption.asc,
                    child: Text('Descending'),
                  ),
                  const PopupMenuItem(
                    value: OrderOption.desc,
                    child: Text('Ascending'),
                  ),
                  const PopupMenuItem(
                    value: OrderOption.Lvlasc,
                    child: Text('Level Ascending'),
                  ),
                  const PopupMenuItem(
                    value: OrderOption.Lvldesc,
                    child: Text('Level Descending'),
                  ),
                ],
              ),
            ],
          ),
          //----------------------------------------------

          /**
       * BODY: SPELL LIST
       */
          body: ListView.builder(
            itemExtent: 50,
            cacheExtent: 2,
            itemCount: spellSet.spells.length,
            itemBuilder: (context, index) {
              //Coloration des lignes de la liste
              Color backgroundColor = Colors.white;
              if (spellSet.spells[index].GetMedianClassLevel().isEven) {
                if (currentOrder == OrderOption.Lvlasc ||
                    currentOrder == OrderOption.Lvldesc) {
                  backgroundColor = const Color.fromARGB(255, 209, 214, 216);
                }
              }
              return ListTile(
                //Structure de chaque ligne (=> ListTile)
                tileColor: backgroundColor,
                title: RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize:
                            Theme.of(context).textTheme.titleLarge!.fontSize,
                        fontFamily:
                            Theme.of(context).textTheme.titleLarge!.fontFamily,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          // text:
                          //     "${spellSet.spells[index].name} ${spellSet.spells[index].GetLevelByClass(characterClass)}",
                          text:
                              "${spellSet.spells[index].name} ${spellSet.spells[index].GetMedianClassLevel()}",
                        ),
                        //? Option avec les 7 premiers mots
                        TextSpan(
                            text:
                                '     ${spellSet.spells[index].description.split(' ').take(7).join(' ')}...',
                            style: Theme.of(context).textTheme.titleSmall)

                        //? Option avec les 35 premiers caractères ?
                        //TextSpan(text:'${spells_list[index].description.substring(0,35)}...', style: Theme.of(context).textTheme.titleSmall)

                        // TextSpan(text:'\t ${spells_list[index].description.substring(0,
                        //   MediaQuery.of(context).size.width.toInt() - '${spells_list[index].name} ${spells_list[index].GetLevelByClass(character.cclass)}) ...'.length
                        // )}...', style: Theme.of(context).textTheme.titleSmall)
                      ]),
                ),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.isAddable && !removeMode
                        ? IconButton(
                            icon: isAdding[index]
                                ? const Icon(Icons.check, color: Colors.green)
                                : const Icon(Icons.add),
                            onPressed: () async {
                              if (!isAdding[index]) {
                                setState(() {
                                  isAdding[index] = true;
                                });

                                if (widget.nameSet == "Known Spells") {
                                  addToKnownSpell(index);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Row(
                                        children: [
                                          const Icon(Icons.check,
                                              color: Colors.green),
                                          const SizedBox(width: 8),
                                          Text(
                                              "Spell added to ${widget.nameSet}"),
                                        ],
                                      ),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  );
                                } else {
                                  if (AccountManager()
                                          .selectedCharacter
                                          .sets
                                          .where((set) => set.name == nameSet)
                                          .first
                                          .spells
                                          .where((spell) =>
                                              spell.level[
                                                  AccountManager()
                                                      .selectedCharacter
                                                      .characterClass] ==
                                              spellSet.spells[index].level[
                                                  AccountManager()
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
                                              AccountManager()
                                                  .selectedCharacter
                                                  .level]!
                                          .elementAt(
                                              spellSet.spells[index].level[
                                                  AccountManager()
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
                                    addToSet(index);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Row(
                                          children: [
                                            const Icon(Icons.check,
                                                color: Colors.green),
                                            const SizedBox(width: 8),
                                            Text(
                                                "Spell added to ${widget.nameSet}"),
                                          ],
                                        ),
                                        duration: const Duration(seconds: 1),
                                      ),
                                    );
                                  }
                                }

                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    isAdding[index] = false;
                                  });
                                });
                              }
                            },
                          )
                        : const SizedBox(),
                    // Add a second IconButton here
                    !isAddable && removeMode
                        ? IconButton(
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () {
                              if (spellSet.name == "Known Spells") {
                                removeFromKnownSPell(index);
                              }
                            },
                          )
                        : SizedBox(),
                  ],
                ),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SpellDetailsPage(spell: spellSet.spells[index]),
                    ),
                  );
                },
              );
            },
          ),
        ));
  }

  /// this is trash but no time for better:
  ///
  void _showAlert(int count) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Too many spells"),
          content: Text("You have $count spells of this level already"),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void addToSet(int index) {
    wasAdded = true;
    AccountManager()
        .selectedCharacter
        .sets
        .where((set) => set.name == nameSet)
        .first
        .spells
        .add(spellSet.spells[index].copy());
    JsonAccountStrategy().saveCharacters(AccountManager().characters);
  }

  void addToKnownSpell(int index) {
    wasAdded = true;
    AccountManager()
        .selectedCharacter
        .knownSpells
        .spells
        .add(spellSet.spells[index].copy());
    JsonAccountStrategy().saveCharacters(AccountManager().characters);
  }

  void removeFromKnownSPell(int index) {
    AccountManager()
        .selectedCharacter
        .knownSpells
        .spells
        .remove(spellSet.spells[index]);
    JsonAccountStrategy().saveCharacters(AccountManager().characters);
    setState(() {
      // update view
    });
  }

  void searchAdded() {
    wasAdded = true;
  }

// ====
}
