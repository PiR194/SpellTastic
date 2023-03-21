import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/theme_model.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              'Font Size :',
              style: TextStyle(
                fontSize: theme.textTheme.bodyLarge!.fontSize,
                fontFamily: theme.textTheme.bodyLarge!.fontFamily,
                fontWeight: theme.textTheme.bodyLarge!.fontWeight,
              ),
            ),
            Wrap(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Provider.of<ThemeModel>(context, listen: false)
                        .setTheme(ThemeModel.smallFont);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Provider.of<ThemeModel>(context).currentTheme ==
                            ThemeModel.smallFont
                        ? theme.accentColor.withOpacity(0.2)
                        : null,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'S',
                      style: TextStyle(
                        fontSize: theme.textTheme.bodyLarge!.fontSize,
                        fontFamily: theme.textTheme.bodyLarge!.fontFamily,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<ThemeModel>(context, listen: false)
                        .setTheme(ThemeModel.mediumFont);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Provider.of<ThemeModel>(context).currentTheme ==
                            ThemeModel.mediumFont
                        ? theme.accentColor.withOpacity(0.2)
                        : null,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'M',
                      style: TextStyle(
                        fontSize: theme.textTheme.bodyLarge!.fontSize,
                        fontFamily: theme.textTheme.bodyLarge!.fontFamily,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<ThemeModel>(context, listen: false)
                        .setTheme(ThemeModel.largeFont);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Provider.of<ThemeModel>(context).currentTheme ==
                            ThemeModel.largeFont
                        ? theme.accentColor.withOpacity(0.2)
                        : null,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'L',
                      style: TextStyle(
                        fontSize: theme.textTheme.bodyLarge!.fontSize,
                        fontFamily: theme.textTheme.bodyLarge!.fontFamily,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
