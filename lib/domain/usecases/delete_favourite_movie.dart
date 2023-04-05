import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/domain/entities/app_error.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_entity.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_params.dart';
import 'package:movie_app_clean_architecture/domain/repositories/movie_repository.dart';
import 'package:movie_app_clean_architecture/domain/usecases/usecase.dart';

class DeleteFavouriteMovie extends UseCase<void, MovieParams> {
  final MovieRepository movieRepository;
  DeleteFavouriteMovie(this.movieRepository);

  @override
  Future<Either<AppError, void>> call(MovieParams movieParams) async {
    return await movieRepository.deleteFavouriteMovies(movieParams.id);
  }
}
