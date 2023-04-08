part of 'favourite_cubit.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();
}

class FavouriteInitial extends FavouriteState {
  @override
  List<Object> get props => [];
}

class FavouriteMoviesLoaded extends FavouriteState {
  final List<MovieEntity> movies;

  FavouriteMoviesLoaded(this.movies);

  @override
  // TODO: implement props
  List<Object?> get props => [movies];
}

class FavouriteMoviesError extends FavouriteState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class IsFavouriteMovie extends FavouriteState {
  final bool isMovieFavourite;

  IsFavouriteMovie(this.isMovieFavourite);
  @override
  // TODO: implement props
  List<Object?> get props => [isMovieFavourite];
}
