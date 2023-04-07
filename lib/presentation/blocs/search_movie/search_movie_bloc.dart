import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_clean_architecture/domain/entities/app_error.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_search_params.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/search_movies.dart';
import '../loading/loading_cubit.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovies getSearchMovies;
  final LoadingCubit loadingCubit;
  SearchMovieBloc({
    required this.getSearchMovies,
    required this.loadingCubit,
  }) : super(SearchMovieInitial());

  Stream<SearchMovieState> mapEventToState(SearchMovieEvent event) async* {
    if (event is SearchTermChangeEvent) {
      loadingCubit.show();
      if (event.searchTerm.length > 2) {
        yield SearchMovieLoading();
        final Either<AppError, List<MovieEntity>> eitherResponse =
            await getSearchMovies(
                MovieSearchParams(searchTerm: event.searchTerm));

        yield eitherResponse.fold(
          (l) => SearchMovieError(l.appErrorType),
          (r) => SearchMovieLoaded(r),
        );
      }
      loadingCubit.hide();
    }
  }
}
