import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/domain/entities/app_error.dart';
import 'package:movie_app_clean_architecture/domain/repositories/app_repository.dart';
import 'package:movie_app_clean_architecture/domain/usecases/usecase.dart';

class UpdateLanguage extends UseCase<void, String> {
  final AppRepository appRepository;

  UpdateLanguage(this.appRepository);
  @override
  Future<Either<AppError, void>> call(String languageCode) async {
    return await appRepository.updateLanguage(languageCode);
  }
}
