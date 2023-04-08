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
part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final SaveMovie saveMovie;
  final GetFavouriteMovies getFavouriteMovies;
  final DeleteFavouriteMovie deleteFavouriteMovie;
  final CheckIfFavouriteMovie checkIfMovieFavourite;
  FavouriteCubit({
    required this.saveMovie,
    required this.getFavouriteMovies,
    required this.deleteFavouriteMovie,
    required this.checkIfMovieFavourite,
  }) : super(FavouriteInitial());

  void loadFavouriteMovies() async {
    final Either<AppError, List<MovieEntity>> response =
        await getFavouriteMovies(NoParams());
    emit(response.fold(
        (l) => FavouriteMoviesError(), (r) => FavouriteMoviesLoaded(r)));
  }

  void toggleFavouriteMovie(
      {required MovieEntity movie, required bool isFavourite}) async {
    if (isFavourite) {
      await deleteFavouriteMovie(MovieParams(movie.id));
    } else {
      await saveMovie(movie);
    }
    final response = await checkIfMovieFavourite(MovieParams(movie.id));
    emit(response.fold(
        (l) => FavouriteMoviesError(), (r) => IsFavouriteMovie(r)));
  }

  void checkIfFavouriteMovie(int movieId) async {
    final response = await checkIfMovieFavourite(MovieParams(movieId));
    emit(response.fold(
        (l) => FavouriteMoviesError(), (r) => IsFavouriteMovie(r)));
  }

  void deleteFavMovie(int movieId) async {
    await deleteFavouriteMovie(MovieParams(movieId));
    loadFavouriteMovies();
  }
}
