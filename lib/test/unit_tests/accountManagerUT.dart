import 'dart:math';

import 'package:code/src/model/character.dart';

import '../../src/model/accountManager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should be able to add character list to account instance', () {
    List<Character> chars = <Character>[];
    chars.add(Character("_name0", "_cclass0", 3));
    chars.add(Character("_name1", "_cclass1", 5));
    chars.add(Character("_name2", "_cclass2", 4));

    var ac1 = AccountManager();
    ac1.characters = chars;

    expect(3, ac1.characters.length);
  });

  test('Account instance should be a singleton', () {
    List<Character> chars = <Character>[];
    chars.add(Character("_name0", "_cclass0", 3));
    chars.add(Character("_name1", "_cclass1", 5));
    chars.add(Character("_name2", "_cclass2", 4));

    var ac1 = AccountManager();
    ac1.characters = chars;

    var ac2 = AccountManager();

    expect(ac1.characters.length, ac2.characters.length);
  });
}
