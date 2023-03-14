import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  static final smallFont = ThemeData(
    fontFamily: 'Anaktoria',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 22),
      bodyMedium: TextStyle(fontSize: 18),
      titleSmall: TextStyle(fontSize: 20, color: Colors.grey),
      titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    ),
  );

  static final mediumFont = ThemeData(
    fontFamily: 'Anaktoria',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 28),
      bodyMedium: TextStyle(fontSize: 24),
      titleSmall: TextStyle(fontSize: 26, color: Colors.grey),
      titleLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    ),
  );

  static final largeFont = ThemeData(
    fontFamily: 'Anaktoria',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 34),
      bodyMedium: TextStyle(fontSize: 30),
      titleSmall: TextStyle(fontSize: 32, color: Colors.grey),
      titleLarge: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
    ),
  );

  ThemeData _currentTheme = mediumFont;

  ThemeData get currentTheme => _currentTheme;

  void setTheme(ThemeData themeData) {
    _currentTheme = themeData;
    notifyListeners();
  }
}
