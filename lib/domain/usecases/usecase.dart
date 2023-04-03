import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/domain/entities/app_error.dart';

///Type - What does the Usecase return, Params - What is required to call API
abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
