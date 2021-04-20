import 'package:flutter/material.dart';
import 'package:star_wars_flutter/ui/my_app.dart';
import 'main/main_common.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> main() async {
  await appInit();
  if (kIsWeb == false) {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  }
  runApp(const MyApp());
}
