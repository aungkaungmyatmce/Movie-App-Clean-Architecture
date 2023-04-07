import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_clean_architecture/domain/entities/app_error.dart';
import 'package:movie_app_clean_architecture/domain/entities/no_params.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_trending.dart';
import '../loading/loading_cubit.dart';
import '../movie_backdrop/movie_backdrop_cubit.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropCubit movieBackdropCubit;
  final LoadingCubit loadingCubit;
  MovieCarouselBloc({
    required this.getTrending,
    required this.movieBackdropCubit,
    required this.loadingCubit,
  }) : super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(MovieCarouselEvent event) async* {
    if (event is CarouselLoadEvent) {
      loadingCubit.show();
      final moviesEither = await getTrending(NoParams());
      yield moviesEither.fold((l) => MovieCarouselError(l.appErrorType),
          (movies) {
        movieBackdropCubit.backdropChanged(movies[event.defaultIndex]);
        return MovieCarouselLoaded(
            movies: movies, defaultIndex: event.defaultIndex);
      });
      loadingCubit.hide();
    }
  }
}
