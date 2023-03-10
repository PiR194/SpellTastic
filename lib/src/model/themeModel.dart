import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  static final smallFont = ThemeData(
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 14),
      bodyMedium: TextStyle(fontSize: 12),
      titleLarge: TextStyle(fontSize: 16),
    ),
  );

  static final mediumFont = ThemeData(
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
      titleLarge: TextStyle(fontSize: 18),
    ),
  );

  static final largeFont = ThemeData(
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18),
      bodyMedium: TextStyle(fontSize: 16),
      titleLarge: TextStyle(fontSize: 20),
    ),
  );

  ThemeData _currentTheme = smallFont;

  ThemeData get currentTheme => _currentTheme;

  void setTheme(ThemeData themeData) {
    _currentTheme = themeData;
    notifyListeners();
  }
}
