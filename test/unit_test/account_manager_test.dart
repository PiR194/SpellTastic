@Skip('Need to convert character class to enum')

import 'dart:ffi';
import 'dart:math';

import 'package:code/src/model/character_class.dart';
import 'package:code/src/model/character.dart';
import '../../lib/src/model/account_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Add', () {
    test('Start empty', () {
      var accountManager = AccountManager();
      expect(0, accountManager.characters.length);
    });
    test('Should be able to add character list to account instance', () {
      List<Character> chars = <Character>[];
      chars.add(Character("_name0", CharacterClass.bard, 3));
      chars.add(Character("_name1", CharacterClass.alchemist, 5));
      chars.add(Character("_name2", CharacterClass.cleric, 4));

      var ac1 = AccountManager();
      ac1.characters = chars;
      expect(3, ac1.characters.length);
    });

    test('Random number of Add', () {
      var nbOcc = Random().nextInt(10000000);
      var accountManager = AccountManager();
      accountManager.characters = [];
      for (var i = 0; i < nbOcc; i++) {
        accountManager
            .addCharacter(Character('_name', CharacterClass.antipaladin, 2));
      }
      expect(nbOcc, accountManager.characters.length);
    });
  });

  group('remove', () {
    test('when empty', () {
      var accountManager = AccountManager();
      accountManager.characters = [];
      accountManager
          .removeCharacter(Character('_name', CharacterClass.antipaladin, 0));
      expect(0, accountManager.characters.length);
    });

    test('When filled', () {
      var accountManager = AccountManager();
      accountManager.characters = [];
      Character character = Character('_name', CharacterClass.alchemist, 0);
      accountManager.addCharacter(character);
      accountManager.addCharacter(Character('_name2', CharacterClass.bard, 2));
      accountManager.removeCharacter(character);
      expect(1, accountManager.characters.length);
    });
  });

  group('Constructor', () {
    test('Account instance should be a singleton', () {
      List<Character> chars = <Character>[];
      chars.add(Character("_name0", CharacterClass.bard, 3));
      chars.add(Character("_name1", CharacterClass.alchemist, 5));
      chars.add(Character("_name2", CharacterClass.cleric, 4));

      var ac1 = AccountManager();
      ac1.characters = chars;

      var ac2 = AccountManager();

      expect(ac1, ac2);
      expect(ac1.characters.length, ac2.characters.length);
    });
  });
}
