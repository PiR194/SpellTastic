import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  static final extraSmallFont = ThemeData(
    fontFamily: null,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 6),
      bodyMedium: TextStyle(fontSize: 2),
      titleLarge: TextStyle(
          fontSize: 10, fontWeight: FontWeight.bold, fontFamily: 'Anaktoria'),
      titleSmall: TextStyle(
          fontSize: 4, color: Colors.grey, fontStyle: FontStyle.italic),
    ),
  );

  static final smallFont = ThemeData(
    fontFamily: null,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 12),
      titleLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Anaktoria'),
      titleSmall: TextStyle(
          fontSize: 14, color: Colors.grey, fontStyle: FontStyle.italic),
    ),
  );

  static final mediumFont = ThemeData(
    fontFamily: null,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 28),
      bodyMedium: TextStyle(fontSize: 24),
      titleLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Anaktoria'),
      titleSmall: TextStyle(
          fontSize: 26, color: Colors.grey, fontStyle: FontStyle.italic),
    ),
  );

  static final largeFont = ThemeData(
    fontFamily: null,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 40),
      bodyMedium: TextStyle(fontSize: 36),
      titleLarge: TextStyle(
          fontSize: 44, fontWeight: FontWeight.bold, fontFamily: 'Anaktoria'),
      titleSmall: TextStyle(
          fontSize: 38, color: Colors.grey, fontStyle: FontStyle.italic),
    ),
  );

  static final extraLargeFont = ThemeData(
    fontFamily: null,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 52),
      bodyMedium: TextStyle(fontSize: 48),
      titleLarge: TextStyle(
          fontSize: 56, fontWeight: FontWeight.bold, fontFamily: 'Anaktoria'),
      titleSmall: TextStyle(
          fontSize: 50, color: Colors.grey, fontStyle: FontStyle.italic),
    ),
  );

  ThemeData _currentTheme = mediumFont;

  ThemeData get currentTheme => _currentTheme;

  void setTheme(ThemeData themeData) {
    _currentTheme = themeData;
    notifyListeners();
  }
}
