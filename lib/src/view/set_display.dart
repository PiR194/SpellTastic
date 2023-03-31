import 'package:code/src/model/spell.dart';
import 'package:code/src/view/dynamic_spell_list_page.dart';
import 'package:code/src/view/widgets/spellSetWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/account_manager.dart';
import '../model/spellSetManager.dart';
import '../model/spell_set.dart';
import '../model/spell_set_check_use.dart';
import 'home.dart';

class SetDisplay extends StatefulWidget {
  final SpellSet fullSet;

  const SetDisplay({Key? key, required this.fullSet}) : super(key: key);

  @override
  _SetDisplayState createState() => _SetDisplayState(fullSet);
}

class _SetDisplayState extends State<SetDisplay> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<SpellSet> selectedSpellSet = [];
  late String setName;
  late Map<int, bool> isCheckedList;

  _SetDisplayState(SpellSet fullSet) {
    setName = fullSet.name;
    selectedSpellSet = SpellSetManager.sortByLevel(
        fullSet, AccountManager().selectedCharacter.characterClass);
    isCheckedList = {};
  }

  void onAddSpell(String name) {
    setState(() {
      selectedSpellSet = SpellSetManager.sortByLevel(
          AccountManager()
              .selectedCharacter
              .sets
              .where((spell) => spell.name == name)
              .first,
          AccountManager().selectedCharacter.characterClass);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const Color accentColor = Color(0xFF9C27B0);

    return Scaffold(
      appBar: AppBar(
        /* ** SET NAME ** */
        title: Text(
          setName,
          style: TextStyle(
            fontSize: theme.textTheme.bodyLarge!.fontSize,
            fontFamily: theme.textTheme.bodyLarge!.fontFamily,
          ),
        ),
        backgroundColor: accentColor,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DynamicSpellListPage(
                                    spellSet: AccountManager()
                                        .selectedCharacter
                                        .knownSpells,
                                    characterClass: AccountManager()
                                        .selectedCharacter
                                        .characterClass,
                                    isReadonly: true,
                                    isAddable: true,
                                    nameSet: setName,
                                  )))
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: _currentPage == selectedSpellSet.length
                        ? null
                        : () {
                            _goToPage(_currentPage - 1);
                          },
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: _currentPage == selectedSpellSet.length - 1
                        ? null
                        : () {
                            _goToPage(_currentPage + 1);
                          },
                  ),
                ],
              ),
              RawKeyboardListener(
                focusNode: FocusNode(),
                onKey: (event) {
                  if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
                    if (_currentPage != 0) {
                      _goToPage(_currentPage - 1);
                    }
                  } else if (event.logicalKey ==
                      LogicalKeyboardKey.arrowRight) {
                    if (_currentPage != 1) {
                      _goToPage(_currentPage + 1);
                    }
                  } else if (event.logicalKey ==
                      LogicalKeyboardKey.arrowDown) {}
                },
                child: Container(),
              ),
            ],
          ),
        ],
      ),
      body: selectedSpellSet.isEmpty
          ? Center(child: Text('This set is empty!'))
          : Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemCount: selectedSpellSet.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: SpellSetWidget(
                            currentSet: selectedSpellSet[index],
                            isCheckedList: isCheckedList,
                            onCheckChanged: (int spellId, bool isChecked) {
                              // update isCheckedList whenever a checkbox is clicked
                              setState(() {
                                isCheckedList[spellId] = isChecked;
                              });
                            }),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
