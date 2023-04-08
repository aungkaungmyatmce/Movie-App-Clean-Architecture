import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_clean_architecture/domain/entities/app_error.dart';
import 'package:movie_app_clean_architecture/domain/entities/no_params.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_coming_soon.dart';
import '../../../domain/usecases/get_playing_now.dart';
import '../../../domain/usecases/get_popular.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedCubit extends Cubit<MovieTabbedState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;

  MovieTabbedCubit({
    required this.getPopular,
    required this.getPlayingNow,
    required this.getComingSoon,
  }) : super(MovieTabbedInitial(currentTabIndex: 0));

  void movieTabChange(int currentTabIndex) async {
    print('MovieTabChangedEvent');
    emit(MovieTabLoading(currentIndex: currentTabIndex));
    print('MovieTabLoading : $currentTabIndex');
    late Either<AppError, List<MovieEntity>> moviesEither;
    switch (currentTabIndex) {
      case 0:
        moviesEither = await getPopular(NoParams());
        break;

      case 1:
        moviesEither = await getPlayingNow(NoParams());
        break;

      case 2:
        moviesEither = await getComingSoon(NoParams());
        break;
    }

    emit(moviesEither.fold(
        (l) => MovieTabLoadError(
              currentTabIndex: currentTabIndex,
              errorType: l.appErrorType,
            ),
        (movies) =>
            MovieTabChanged(movies: movies, currentTabIndex: currentTabIndex)));
  }

  // @override
  // Stream<MovieTabbedState> mapEventToState(MovieTabbedEvent event) async* {
  //   if (event is MovieTabChangedEvent) {
  //     print('MovieTabChangedEvent');
  //     yield MovieTabLoading(currentIndex: event.currentTabIndex);
  //     print('MovieTabLoading : ${event.currentTabIndex}');
  //     late Either<AppError, List<MovieEntity>> moviesEither;
  //     switch (event.currentTabIndex) {
  //       case 0:
  //         moviesEither = await getPopular(NoParams());
  //         break;
  //
  //       case 1:
  //         moviesEither = await getPlayingNow(NoParams());
  //         break;
  //
  //       case 2:
  //         moviesEither = await getComingSoon(NoParams());
  //         break;
  //     }
  //     // yield MovieTabLoadError(
  //     //   currentTabIndex: event.currentTabIndex,
  //     //   errorType: AppErrorType.api,
  //     // );
  //
  //     yield moviesEither.fold(
  //         (l) => MovieTabLoadError(
  //               currentTabIndex: event.currentTabIndex,
  //               errorType: l.appErrorType,
  //             ),
  //         (movies) => MovieTabChanged(
  //             movies: movies, currentTabIndex: event.currentTabIndex));
  //   }
  // }
}
