import 'package:flutter/material.dart';
import 'package:star_wars_flutter/cache/model/cached_character.dart';
import 'package:star_wars_flutter/cache/model/cached_movie.dart';
import 'package:star_wars_flutter/cache/shared_prefs.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> appInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefs.init();
  await Hive.initFlutter();
  Hive.registerAdapter(CachedMovieAdapter());
  Hive.registerAdapter(CachedCharacterAdapter());
}
