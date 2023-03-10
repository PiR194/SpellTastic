import 'package:flutter/material.dart';

import '../../main.dart';

class SettingsPage extends StatefulWidget {
  final ThemeData currentTheme;
  final Function(ThemeData) onThemeChanged;

  const SettingsPage(
      {Key? key, required this.currentTheme, required this.onThemeChanged})
      : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ThemeData _selectedTheme = smallTheme;

  void setTheme(ThemeData theme) {
    setState(() {
      _selectedTheme = theme;
    });
    widget.onThemeChanged(theme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose a font size:',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            RadioListTile<ThemeData>(
              title: const Text('Small'),
              value: smallTheme,
              groupValue: _selectedTheme,
              onChanged: (value) {
                setTheme(value!);
              },
            ),
            RadioListTile<ThemeData>(
              title: const Text('Medium'),
              value: mediumTheme,
              groupValue: _selectedTheme,
              onChanged: (value) {
                setTheme(value!);
              },
            ),
            RadioListTile<ThemeData>(
              title: const Text('Large'),
              value: largeTheme,
              groupValue: _selectedTheme,
              onChanged: (value) {
                setTheme(value!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
