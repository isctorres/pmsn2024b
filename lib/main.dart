import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pmsn2024b/screens/home_screen.dart';
import 'package:pmsn2024b/screens/login_screen.dart';
import 'package:pmsn2024b/screens/movies_screen.dart';
import 'package:pmsn2024b/settings/global_values.dart';
import 'package:pmsn2024b/settings/theme_settings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(
      valueListenable: GlobalValues.banThemeDark,
      builder: (context, value, widget) {
        return MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
          theme: value 
            ? ThemeSettings.darkTheme() 
            : ThemeSettings.ligthTheme(),
          routes: {
            "/home" : (context) => HomeScreen(),
            "/db" : (context) => MoviesScreen()
          },
        );
      }
    );
  }
}