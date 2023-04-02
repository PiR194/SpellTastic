@Skip('Not ready yet')
import 'package:code/src/model/character_class.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Name should have be same as enum with first letter uppercase', () {
    var name = CharacterClass.bard.getImagePath();

    expect(name, "assets/class_icons/Bard.png");
  });
}
