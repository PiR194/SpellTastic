import 'dart:convert';
import 'package:code/src/data/json_account_strategy.dart';
import 'package:code/src/model/character_class.dart';
import 'package:flutter/material.dart';

import '../../model/account_manager.dart';
import '../../model/character.dart';

class CharacterFormWidget extends StatefulWidget {
  @override
  _CharacterFormState createState() => _CharacterFormState();
}

class _CharacterFormState extends State<CharacterFormWidget> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _class = '';
  int _level = 1;

  CharacterClass? _selectedClass;

  final List<CharacterClass> _classes = [];

  List<Character> listCharacter = [];

  @override
  void initState() {
    super.initState();

    for (var characterClass in CharacterClass.values) {
      _classes.add(characterClass);
    }

    loadCharacters();
  }

  Future<void> loadCharacters() async {
    final JsonAccountStrategy accountStrategy = JsonAccountStrategy();

    AccountManager().characters = await accountStrategy.loadCharacters();
    setState(() {
      listCharacter = AccountManager().characters;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const Color accentColor = Color(0xFF9C27B0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Creation'),
        backgroundColor: accentColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    fontSize: theme.textTheme.bodyLarge!.fontSize,
                    fontFamily: theme.textTheme.bodyLarge!.fontFamily,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              DropdownButton<CharacterClass>(
                value: _selectedClass,
                items: _classes.map((CharacterClass value) {
                  return DropdownMenuItem<CharacterClass>(
                    value: value,
                    child: Text(
                      value.toString().split('.').last,
                      style: TextStyle(
                        fontSize: theme.textTheme.bodyMedium!.fontSize,
                        fontFamily: theme.textTheme.bodyMedium!.fontFamily,
                      ),
                    ),
                  );
                }).toList(),
                hint: Text(
                  'Select class',
                  style: TextStyle(
                    fontSize: theme.textTheme.bodyLarge!.fontSize,
                    fontFamily: theme.textTheme.bodyLarge!.fontFamily,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedClass = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              Text(
                'Maximum Character Level $_level',
                style: TextStyle(
                  fontSize: theme.textTheme.bodyMedium!.fontSize,
                  fontFamily: theme.textTheme.bodyMedium!.fontFamily,
                ),
              ),
              Slider(
                value: _level.toDouble(),
                min: 1,
                max: 20,
                divisions: 19,
                label: _level.toString(),
                onChanged: (value) {
                  setState(() {
                    _level = value.round();
                  });
                },
                activeColor: Colors.green,
                inactiveColor: Colors.grey,
                thumbColor: Colors.brown,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(accentColor),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    Character character =
                        Character(_name, _selectedClass!, _level);

                    listCharacter.add(character);
                    JsonAccountStrategy().saveCharacters(listCharacter);
                    JsonAccountStrategy().loadCharacters();
                  }
                  Navigator.pushNamed(context, '/');
                },
                child: Text(
                  'CREATE !',
                  style: TextStyle(
                    fontSize: theme.textTheme.bodyMedium!.fontSize,
                    fontFamily: theme.textTheme.bodyMedium!.fontFamily,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
