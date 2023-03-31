import 'package:flutter/material.dart';

import '../../model/account_manager.dart';
import '../../model/spell_set.dart';
import '../dynamic_spell_list_page.dart';

class AddSpellWidget extends StatelessWidget {
  final SpellSet spellSet;
  final String? nameSet;

  const AddSpellWidget({
    Key? key,
    required this.spellSet,
    this.nameSet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DynamicSpellListPage(
                    spellSet: AccountManager().selectedCharacter.classSpells,
                    characterClass:
                        AccountManager().selectedCharacter.characterClass,
                    isReadonly: true,
                    isAddable: true,
                    nameSet: nameSet ?? "",
                  )),
        );
      },
    );
  }
}
