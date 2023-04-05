import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_detail_entity.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_params.dart';
import 'package:movie_app_clean_architecture/domain/repositories/movie_repository.dart';
import 'package:movie_app_clean_architecture/domain/usecases/usecase.dart';
import '../entities/app_error.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity, MovieParams> {
  final MovieRepository repository;
  GetMovieDetail(this.repository);

  @override
  Future<Either<AppError, MovieDetailEntity>> call(
      MovieParams movieParams) async {
    return await repository.getMovieDetail(movieParams.id);
  }
}
