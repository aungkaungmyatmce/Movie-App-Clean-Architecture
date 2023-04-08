part of 'search_movie_cubit.dart';

abstract class SearchMovieEvent extends Equatable {
  const SearchMovieEvent();
}

class SearchTermChangeEvent extends SearchMovieEvent {
  final String searchTerm;

  SearchTermChangeEvent(this.searchTerm);

  @override
  // TODO: implement props
  List<Object?> get props => [searchTerm];
}
