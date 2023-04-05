import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app_clean_architecture/common/constants/languages.dart';
import 'package:movie_app_clean_architecture/data/core/api_client.dart';
import 'package:movie_app_clean_architecture/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app_clean_architecture/data/repositories/movie_repository_impl.dart';
import 'package:movie_app_clean_architecture/domain/repositories/movie_repository.dart';
import 'package:movie_app_clean_architecture/domain/usecases/check_if_movie_favourite.dart';
import 'package:movie_app_clean_architecture/domain/usecases/delete_favourite_movie.dart';
import 'package:movie_app_clean_architecture/domain/usecases/get_cast.dart';
import 'package:movie_app_clean_architecture/domain/usecases/get_coming_soon.dart';
import 'package:movie_app_clean_architecture/domain/usecases/get_favourite_movies.dart';
import 'package:movie_app_clean_architecture/domain/usecases/get_movie_detail.dart';
import 'package:movie_app_clean_architecture/domain/usecases/get_playing_now.dart';
import 'package:movie_app_clean_architecture/domain/usecases/get_popular.dart';
import 'package:movie_app_clean_architecture/domain/usecases/get_trending.dart';
import 'package:movie_app_clean_architecture/domain/usecases/get_videos.dart';
import 'package:movie_app_clean_architecture/domain/usecases/save_movie.dart';
import 'package:movie_app_clean_architecture/domain/usecases/search_movies.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/videos/videos_bloc.dart';

import '../data/data_sources/movie_local_datasource.dart';
import '../presentation/blocs/favourite/favourite_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  /// Data Source
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl());

  /// Use Cases
  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));

  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));

  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));

  getItInstance.registerLazySingleton<GetMovieDetail>(
      () => GetMovieDetail(getItInstance()));

  getItInstance.registerLazySingleton<GetCast>(() => GetCast(getItInstance()));

  getItInstance
      .registerLazySingleton<GetVideos>(() => GetVideos(getItInstance()));

  getItInstance
      .registerLazySingleton<SearchMovies>(() => SearchMovies(getItInstance()));

  getItInstance
      .registerLazySingleton<SaveMovie>(() => SaveMovie(getItInstance()));

  getItInstance.registerLazySingleton<GetFavouriteMovies>(
      () => GetFavouriteMovies(getItInstance()));

  getItInstance.registerLazySingleton<DeleteFavouriteMovie>(
      () => DeleteFavouriteMovie(getItInstance()));

  getItInstance.registerLazySingleton<CheckIfFavouriteMovie>(
      () => CheckIfFavouriteMovie(getItInstance()));

  ///Repository
  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance(), getItInstance()));

  ///Bloc
  getItInstance
      .registerFactory(() => MovieCarouselBloc(getTrending: getItInstance()));

  getItInstance.registerFactory(() => MovieBackdropBloc());

  getItInstance.registerFactory(() => MovieTabbedBloc(
        getPopular: getItInstance(),
        getPlayingNow: getItInstance(),
        getComingSoon: getItInstance(),
      ));

  getItInstance.registerFactory(() => MovieDetailBloc(
        getMovieDetail: getItInstance(),
        castBloc: getItInstance(),
        videosBloc: getItInstance(),
        favouriteBloc: getItInstance(),
      ));

  getItInstance.registerFactory(() => SearchMovieBloc(
        getSearchMovies: getItInstance(),
      ));

  getItInstance.registerFactory(() => FavouriteBloc(
        saveMovie: getItInstance(),
        checkIfMovieFavourite: getItInstance(),
        getFavouriteMovies: getItInstance(),
        deleteFavouriteMovie: getItInstance(),
      ));

  getItInstance.registerFactory(() => CastBloc(getCast: getItInstance()));

  getItInstance.registerFactory(() => VideosBloc(getVideos: getItInstance()));

  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());
}
