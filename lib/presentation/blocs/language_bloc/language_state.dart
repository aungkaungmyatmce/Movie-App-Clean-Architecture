part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();
}

class LanguageInitial extends LanguageState {
  @override
  List<Object> get props => [];
}

class LanguageLoaded extends LanguageState {
  final Locale locale;

  const LanguageLoaded(this.locale);

  @override
  List<Object?> get props => [locale.languageCode];
}

class LanguageError extends LanguageState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
