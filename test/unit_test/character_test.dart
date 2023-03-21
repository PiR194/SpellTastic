@Skip('Not ready yet')

import 'package:code/src/model/character.dart';
import 'package:code/src/model/character_class.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('constructor', () {
    test('default parameter', () {
      var char = Character('_name', CharacterClass.alchemist, 1);
      expect('_name', char.name);
      expect(CharacterClass.alchemist, char.characterClass);
      expect(1, char.level);
      //expect(0, char.knownSpells);
      expect(0, char.sets.length);
    });
  });
}
