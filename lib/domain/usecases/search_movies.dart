import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/domain/entities/app_error.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_entity.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_search_params.dart';
import 'package:movie_app_clean_architecture/domain/repositories/movie_repository.dart';
import 'package:movie_app_clean_architecture/domain/usecases/usecase.dart';

class SearchMovies extends UseCase<List<MovieEntity>, MovieSearchParams> {
  final MovieRepository repository;

  SearchMovies(this.repository);
  @override
  Future<Either<AppError, List<MovieEntity>>> call(
      MovieSearchParams searchParams) async {
    return await repository.getSearchMovies(searchParams.searchTerm);
  }
}
