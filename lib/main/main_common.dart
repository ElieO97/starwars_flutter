import 'package:cache/model/cached_character.dart';
import 'package:cache/model/cached_movie.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:presentation/shared_prefs.dart';

Future<void> appInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefs.init();
  await Hive.initFlutter();
  Hive.registerAdapter(CachedMovieAdapter());
  Hive.registerAdapter(CachedCharacterAdapter());
}
