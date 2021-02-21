import 'package:flutter/material.dart';
import 'package:star_wars_flutter/shared_prefs.dart';

Future<void> appInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefs.init();
}
