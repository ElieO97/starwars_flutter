import 'package:flutter/material.dart';
import 'package:star_wars_flutter/ui/my_app.dart';
import 'main/main_common.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

Future<void> main() async {
  await appInit();
  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  runApp(const MyApp());
}
