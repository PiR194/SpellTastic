import 'package:flutter/material.dart';

import '../../model/account_manager.dart';
import '../../model/spell_set.dart';
import '../dynamic_spell_list_page.dart';

class AddFavorite extends StatelessWidget {
  final SpellSet spellSet;
  final String? nameSet;

  const AddFavorite({
    Key? key,
    required this.spellSet,
    this.nameSet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Icon(Icons.star_half_outlined),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DynamicSpellListPage(
                    spellSet: AccountManager().favoriteSpells,
                    characterClass:
                        AccountManager().selectedCharacter.characterClass,
                    isReadonly: true,
                    isAddable: false,
                    nameSet: nameSet ?? "",
                  )),
        );
      },
    );
  }
}
