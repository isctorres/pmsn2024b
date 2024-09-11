import 'package:flutter/material.dart';

class ThemeSettings {
  static ThemeData ligthTheme(){
    final theme = ThemeData.light();
    return theme.copyWith(
      //primaryColorLight: Colors.redAccent,
      /*appBarTheme: AppBarTheme(
        backgroundColor: Colors.redAccent
      ),*/
      scaffoldBackgroundColor: Colors.amber,
    );
  }

  static ThemeData darkTheme(){
    final theme = ThemeData.dark();
    return theme.copyWith(
      scaffoldBackgroundColor: Colors.grey,
    );
  }

  static ThemeData warmTheme(){
    final theme = ThemeData.light();
    return theme.copyWith();
  }
}