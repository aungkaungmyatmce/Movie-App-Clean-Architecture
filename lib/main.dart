import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movie_app_clean_architecture/data/tables/movie_table.dart';
import 'package:movie_app_clean_architecture/presentation/movie_app.dart';
import 'di/get_it.dart' as getIt;
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getIt.init();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(MovieTableAdapter());
  runApp(MovieApp());
}
