import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/themeModel.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text('Small Font'),
            trailing: Radio(
              value: ThemeModel.smallFont,
              groupValue: Provider.of<ThemeModel>(context).currentTheme,
              onChanged: (value) {
                Provider.of<ThemeModel>(context, listen: false)
                    .setTheme(value!);
              },
            ),
          ),
          ListTile(
            title: Text('Medium Font'),
            trailing: Radio(
              value: ThemeModel.mediumFont,
              groupValue: Provider.of<ThemeModel>(context).currentTheme,
              onChanged: (value) {
                Provider.of<ThemeModel>(context, listen: false)
                    .setTheme(value!);
              },
            ),
          ),
          ListTile(
            title: Text('Large Font'),
            trailing: Radio(
              value: ThemeModel.largeFont,
              groupValue: Provider.of<ThemeModel>(context).currentTheme,
              onChanged: (value) {
                Provider.of<ThemeModel>(context, listen: false)
                    .setTheme(value!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
