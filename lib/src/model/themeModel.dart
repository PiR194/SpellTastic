import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  static final smallFont = ThemeData(
    fontFamily: null,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 12),
      titleLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Anaktoria'),
    ),
  );

  static final mediumFont = ThemeData(
    fontFamily: null,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 28),
      bodyMedium: TextStyle(fontSize: 24),
      titleLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Anaktoria'),
    ),
  );

  static final largeFont = ThemeData(
    fontFamily: null,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 40),
      bodyMedium: TextStyle(fontSize: 36),
      titleLarge: TextStyle(
          fontSize: 44, fontWeight: FontWeight.bold, fontFamily: 'Anaktoria'),
    ),
  );

  ThemeData _currentTheme = mediumFont;

  ThemeData get currentTheme => _currentTheme;

  void setTheme(ThemeData themeData) {
    _currentTheme = themeData;
    notifyListeners();
  }
}
