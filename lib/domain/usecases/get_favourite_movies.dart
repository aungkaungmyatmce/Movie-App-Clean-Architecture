import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/domain/entities/app_error.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_entity.dart';
import 'package:movie_app_clean_architecture/domain/entities/no_params.dart';
import 'package:movie_app_clean_architecture/domain/repositories/movie_repository.dart';
import 'package:movie_app_clean_architecture/domain/usecases/usecase.dart';

class GetFavouriteMovies extends UseCase<List<MovieEntity>, NoParams>{
  final MovieRepository movieRepository;
  GetFavouriteMovies(this.movieRepository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams)async {
    return await movieRepository.getFavouriteMovies();
  }

}