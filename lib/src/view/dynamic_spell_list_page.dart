/*
* this class takes a list of spells and 
* diplays them in our a SpellListView
*/
import 'package:code/src/model/account_manager.dart';
import 'package:code/src/model/spell_set.dart';
import 'package:code/src/view/set_display.dart';
import 'package:code/src/view/widgets/add_spells_widget.dart';
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
  });

  SpellSet spellSet;
  final CharacterClass characterClass;
  final bool isReadonly;
  final bool isAddable;
  bool removeMode = false;
  final String nameSet;

  @override
  Widget build(BuildContext context) {
    // propreties for responsivity / theme
    final theme = Theme.of(context);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
                  delegate: SpellSearchDelegate(spellSet.spells,
                      isAddable: isAddable, nameSet: nameSet));
            },
          ),
          Visibility(
              visible: spellSet.name == 'Known Spells' && !isReadonly,
              child: IconButton(
                icon: const Icon(Icons.edit),
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
                    spellSet.spells.sort(
                        (spell1, spell2) => spell1.name.compareTo(spell2.name));
                  }
                  break;

                case OrderOption.desc:
                  {
                    //tri descendant
                    spellSet.spells.sort(
                        (spell1, spell2) => spell2.name.compareTo(spell1.name));
                  }
                  break;

                case OrderOption.Lvlasc:
                  {
                    //tri par niveaux ascendant
                    spellSet.spells.sort((spell1, spell2) =>
                        (spell1.GetLevelByClass(characterClass) ?? 0).compareTo(
                            spell2.GetLevelByClass(characterClass) ?? 0));
                  }
                  break;

                case OrderOption.Lvldesc:
                  {
                    //tri par niveaux descendant
                    spellSet.spells.sort((spell1, spell2) =>
                        (spell2.GetLevelByClass(characterClass) ?? 0).compareTo(
                            spell1.GetLevelByClass(characterClass) ?? 0));
                  }
                  break;
              }
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
          if (spellSet.spells[index].GetLevelByClass(characterClass)?.isEven ??
              false) {
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
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                    fontFamily:
                        Theme.of(context).textTheme.titleLarge!.fontFamily,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "${spellSet.spells[index].name} ${spellSet.spells[index].GetLevelByClass(characterClass)}",
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
                isAddable && !removeMode
                    ? IconButton(
                        icon: Icon(Icons.add_box_outlined),
                        onPressed: () {
                          if (nameSet == "Known Spells") {
                            addToKnownSpell(index);
                          } else {
                            addToSet(index);
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
    );
  }

  /// this is trash but no time for better:

  void addToSet(int index) {
    AccountManager()
        .selectedCharacter
        .sets
        .where((set) => set.name == nameSet)
        .first
        .spells
        .add(spellSet.spells[index].copy());
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => SetDisplay(
              fullSet: AccountManager()
                  .selectedCharacter
                  .sets
                  .where((set) => set.name == nameSet)
                  .first)),
    );
    JsonAccountStrategy().saveCharacters(AccountManager().characters);
  }

  void addToKnownSpell(int index) {
    AccountManager()
        .selectedCharacter
        .knownSpells
        .spells
        .add(spellSet.spells[index].copy());
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => DynamicSpellListPage(
              spellSet: AccountManager().selectedCharacter.knownSpells,
              characterClass: AccountManager().selectedCharacter.characterClass,
              isReadonly: false,
              isAddable: false)),
    );
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

// ====
}
