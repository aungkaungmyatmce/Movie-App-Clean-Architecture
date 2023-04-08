import 'dart:async';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_clean_architecture/common/constants/languages.dart';
import 'package:movie_app_clean_architecture/domain/entities/language_entity.dart';
import 'package:movie_app_clean_architecture/domain/entities/no_params.dart';

import '../../../domain/usecases/language_usecases/get_preferred_language.dart';
import '../../../domain/usecases/language_usecases/update_language.dart';

class LanguageCubit extends Cubit<Locale> {
  final GetPreferredLanguage getPreferredLanguage;
  final UpdateLanguage updateLanguage;
  LanguageCubit(
      {required this.getPreferredLanguage, required this.updateLanguage})
      : super(Locale(Languages.languages[0].code));

  Future<void> toggleLanguage(LanguageEntity language) async {
    await updateLanguage(language.code);
    loadPreferredLanguage();
  }

  void loadPreferredLanguage() async {
    final response = await getPreferredLanguage(NoParams());
    emit(response.fold(
      (l) => Locale(Languages.languages[0].code),
      (r) => Locale(r),
    ));
  }
}
