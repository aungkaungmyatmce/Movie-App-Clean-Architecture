import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/domain/entities/app_error.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_entity.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_params.dart';
import 'package:movie_app_clean_architecture/domain/repositories/movie_repository.dart';
import 'package:movie_app_clean_architecture/domain/usecases/usecase.dart';

class CheckIfFavouriteMovie extends UseCase<bool, MovieParams> {
  final MovieRepository movieRepository;
  CheckIfFavouriteMovie(this.movieRepository);

  @override
  Future<Either<AppError, bool>> call(MovieParams movieParams) async {
    return await movieRepository.checkIfMovieFavourite(movieParams.id);
  }
}
