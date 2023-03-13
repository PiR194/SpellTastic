import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/themeModel.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              'Small Font',
              style: TextStyle(
                fontSize: theme.textTheme.bodyLarge!.fontSize,
                fontFamily: theme.textTheme.bodyLarge!.fontFamily,
              ),
            ),
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
            title: Text(
              'Medium Font',
              style: TextStyle(
                fontSize: theme.textTheme.bodyLarge!.fontSize,
                fontFamily: theme.textTheme.bodyLarge!.fontFamily,
              ),
            ),
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
            title: Text(
              'Large Font',
              style: TextStyle(
                fontSize: theme.textTheme.bodyLarge!.fontSize,
                fontFamily: theme.textTheme.bodyLarge!.fontFamily,
              ),
            ),
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
