import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture/domain/entities/no_params.dart';
import 'package:movie_app_clean_architecture/domain/usecases/get_trending.dart';
import 'package:movie_app_clean_architecture/presentation/movie_app.dart';
import 'domain/entities/app_error.dart';
import 'domain/entities/movie_entity.dart';
import 'di/get_it.dart' as getIt;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getIt.init();
  runApp(MovieApp());
}
