import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_clean_architecture/domain/entities/app_error.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_entity.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_params.dart';
import 'package:movie_app_clean_architecture/domain/entities/no_params.dart';
import 'package:movie_app_clean_architecture/domain/usecases/check_if_movie_favourite.dart';

import '../../../domain/usecases/delete_favourite_movie.dart';
import '../../../domain/usecases/get_favourite_movies.dart';
import '../../../domain/usecases/save_movie.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final SaveMovie saveMovie;
  final GetFavouriteMovies getFavouriteMovies;
  final DeleteFavouriteMovie deleteFavouriteMovie;
  final CheckIfFavouriteMovie checkIfMovieFavourite;
  FavouriteBloc({
    required this.saveMovie,
    required this.getFavouriteMovies,
    required this.deleteFavouriteMovie,
    required this.checkIfMovieFavourite,
  }) : super(FavouriteInitial());

  @override
  Stream<FavouriteState> mapEventToState(FavouriteEvent event) async* {
    if (event is ToggleFavouriteMovieEvent) {
      if (event.isFavourite) {
        await deleteFavouriteMovie(MovieParams(event.movieEntity.id));
      } else {
        await saveMovie(event.movieEntity);
      }
      final response =
          await checkIfMovieFavourite(MovieParams(event.movieEntity.id));
      yield response.fold(
          (l) => FavouriteMoviesError(), (r) => IsFavouriteMovie(r));
    } else if (event is LoadFavouriteMovieEvent) {
      yield* _fetchLoadFavouriteMovies();
    } else if (event is CheckIfFavouriteMovieEvent) {
      final response = await checkIfMovieFavourite(MovieParams(event.movieId));
      yield response.fold(
          (l) => FavouriteMoviesError(), (r) => IsFavouriteMovie(r));
    } else if (event is DeleteFavouriteMovieEvent) {
      await deleteFavouriteMovie(MovieParams(event.movieId));
      yield* _fetchLoadFavouriteMovies();
    }
  }

  Stream<FavouriteState> _fetchLoadFavouriteMovies() async* {
    final Either<AppError, List<MovieEntity>> response =
        await getFavouriteMovies(NoParams());
    yield response.fold(
        (l) => FavouriteMoviesError(), (r) => FavouriteMoviesLoaded(r));
  }
}
