import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_clean_architecture/domain/entities/app_error.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_detail_entity.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_params.dart';

import '../../../domain/usecases/get_movie_detail.dart';
import '../cast/cast_bloc.dart';
import '../favourite/favourite_cubit.dart';
import '../loading/loading_cubit.dart';
import '../videos/videos_bloc.dart';
part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final CastCubit castCubit;
  final VideosCubit videosCubit;
  final FavouriteCubit favouriteCubit;
  final LoadingCubit loadingCubit;

  MovieDetailCubit({
    required this.getMovieDetail,
    required this.castCubit,
    required this.videosCubit,
    required this.favouriteCubit,
    required this.loadingCubit,
  }) : super(MovieDetailInitial());

  void loadMovieDetail(int movieId) async {
    loadingCubit.show();
    final Either<AppError, MovieDetailEntity> eitherResponse =
        await getMovieDetail(MovieParams(movieId));
    emit(eitherResponse.fold(
      (l) => MovieDetailError(),
      (r) => MovieDetailLoaded(r),
    ));

    favouriteCubit.checkIfFavouriteMovie(movieId);
    castCubit.loadCast(movieId);
    videosCubit.loadVideos(movieId);
    loadingCubit.hide();
  }
}
