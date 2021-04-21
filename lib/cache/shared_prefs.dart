import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;
  static const String HAS_USER_OVERRIDDEN_SYSTEM_THEME =
      'has_user_overridden_system_theme_key';
  static const String IS_DARK_THEME = 'is_dark_theme_key';

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  bool get hasUserOverriddenSystemTheme =>
      _sharedPrefs!.getBool(HAS_USER_OVERRIDDEN_SYSTEM_THEME) ?? false;

  set hasUserOverriddenSystemTheme(bool value) {
    _sharedPrefs!.setBool(HAS_USER_OVERRIDDEN_SYSTEM_THEME, value);
  }

  bool get isDarkTheme =>
      _sharedPrefs!.getBool(IS_DARK_THEME) ??
      SchedulerBinding.instance!.window.platformBrightness == Brightness.dark;

  set isDarkTheme(bool value) {
    _sharedPrefs!.setBool(IS_DARK_THEME, value);
  }
}

final SharedPrefs sharedPrefs = SharedPrefs();
