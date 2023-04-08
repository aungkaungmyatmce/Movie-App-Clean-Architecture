part of 'movie_tabbed_cubit.dart';

abstract class MovieTabbedState extends Equatable {
  final int currentTabIndex;

  const MovieTabbedState({required this.currentTabIndex});
}

class MovieTabbedInitial extends MovieTabbedState {
  const MovieTabbedInitial({required super.currentTabIndex});

  @override
  List<Object> get props => [];
}

class MovieTabChanged extends MovieTabbedState {
  final List<MovieEntity> movies;
  const MovieTabChanged({required this.movies, required int currentTabIndex})
      : super(currentTabIndex: currentTabIndex);

  @override
  List<Object?> get props => [currentTabIndex, movies];
}

class MovieTabLoadError extends MovieTabbedState {
  final AppErrorType errorType;
  const MovieTabLoadError({
    required int currentTabIndex,
    required this.errorType,
  }) : super(currentTabIndex: currentTabIndex);

  @override
  List<Object?> get props => [currentTabIndex];
}

class MovieTabLoading extends MovieTabbedState {
  MovieTabLoading({required int currentIndex})
      : super(currentTabIndex: currentIndex);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
