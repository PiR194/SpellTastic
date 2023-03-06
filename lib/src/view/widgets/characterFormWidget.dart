import 'package:flutter/material.dart';

class CharacterFormWidget extends StatefulWidget {
  @override
  _CharacterFormState createState() => _CharacterFormState();
}

class _CharacterFormState extends State<CharacterFormWidget> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _class = '';
  int _level = 1;

  String? _selectedClass;

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
                decoration: const InputDecoration(
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
                value: _selectedClass,
                items: _classes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                hint: const Text('Select class'),
                onChanged: (value) {
                  setState(() {
                    _selectedClass = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              Text('Maximum Character Level ' + _level.toString()),
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
                    // do something with the form values
                  }
                },
                child: const Text('CREATE !'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
