import 'package:code/src/model/character.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('constructor', () {
    test('default parameter', () {
      var char = Character('_name', '_cclass', 1);
      expect('_name', char.name);
      expect('_cclass', char.cclass);
      expect(1, char.level);
      expect(0, char.knownSpells.length);
      expect(0, char.sets.length);
    });
  });
}
