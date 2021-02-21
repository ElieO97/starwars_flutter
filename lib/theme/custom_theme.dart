import 'package:flutter/material.dart';
import 'package:star_wars_flutter/shared_prefs.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  ThemeMode get currentTheme =>
      sharedPrefs.isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    sharedPrefs.hasUserOverriddenSystemTheme = true;
    sharedPrefs.isDarkTheme = !sharedPrefs.isDarkTheme;
    notifyListeners();
  }

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              color: Colors.grey,
              textTheme: Theme.of(context).textTheme.apply(
                    bodyColor: Colors.black,
                  ),
            ),
        canvasColor: Colors.white,
        primaryIconTheme: const IconThemeData(color: Colors.black),
        dividerColor: Colors.white,
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat',
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
            ),
        cardColor: Colors.white);
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
            color: Colors.white10,
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: Colors.white,
                ),
          ),
      canvasColor: Colors.black,
      primaryIconTheme: const IconThemeData(color: Colors.white),
      dividerColor: Colors.black,
      brightness: Brightness.dark,
      primaryColor: Colors.white,
      accentColor: Colors.white,
      scaffoldBackgroundColor: Colors.black,
      fontFamily: 'Montserrat',
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
          ),
      cardColor: Colors.white12,
    );
  }
}
