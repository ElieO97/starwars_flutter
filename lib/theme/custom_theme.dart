import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
        dividerColor: Colors.white,
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat',
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
            ),
        cardColor: Colors.white
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return  ThemeData(
        dividerColor: Colors.black,
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        accentColor: Colors.white,
        scaffoldBackgroundColor: Colors.white12,
        fontFamily: 'Montserrat',
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
        ),
        cardColor: Colors.white12

    );
  }
}
