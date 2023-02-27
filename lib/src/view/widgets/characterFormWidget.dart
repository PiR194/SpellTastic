import 'package:flutter/material.dart';

class CharacterFormWidget extends StatefulWidget {
  @override
  _CharacterFormState createState() => _CharacterFormState();
}

class _CharacterFormState extends State<CharacterFormWidget> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _race = '';
  String _class = '';
  int _level = 1;

  String? _selectedRace;
  String? _selectedClass;

  List<String> _races = [
    'Dwarf',
    'Elf',
    'Gnome',
    'Half-Elf',
    'Half-Orc',
    'Halfling',
    'Human'
  ];

  List<String> _classes = [
    'Barbarian',
    'Bard',
    'Cleric',
    'Druid',
    'Fighter',
    'Monk',
    'Paladin',
    'Ranger',
    'Rogue',
    'Sorcerer',
    'Wizard'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Character Creation')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
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
              DropdownButton<String>(
                value: _selectedRace,
                items: _races.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                hint: Text('Select race'),
                onChanged: (value) {
                  setState(() {
                    _selectedRace = value;
                  });
                },
              ),
              DropdownButton<String>(
                value: _selectedClass,
                items: _classes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                hint: Text('Select class'),
                onChanged: (value) {
                  setState(() {
                    _selectedClass = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text('Level ' + _level.toString()),
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
                  thumbColor: Colors.brown),
            ],
          ),
        ),
      ),
    );
  }
}
