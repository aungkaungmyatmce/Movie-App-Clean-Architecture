import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app_clean_architecture/common/constants/languages.dart';
import 'package:movie_app_clean_architecture/data/core/api_client.dart';
import 'package:movie_app_clean_architecture/data/data_sources/authentication_local_data_source.dart';
import 'package:movie_app_clean_architecture/data/data_sources/authentication_remote_data_source.dart';
import 'package:movie_app_clean_architecture/data/data_sources/language_local_data_source.dart';
import 'package:movie_app_clean_architecture/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app_clean_architecture/data/repositories/app_repository_impl.dart';
import 'package:movie_app_clean_architecture/data/repositories/authentication_repository_impl.dart';
import 'package:movie_app_clean_architecture/data/repositories/movie_repository_impl.dart';
import 'package:movie_app_clean_architecture/domain/repositories/authentication_repository.dart';
import 'package:movie_app_clean_architecture/domain/repositories/movie_repository.dart';
import 'package:movie_app_clean_architecture/domain/usecases/authentication/login_user.dart';
import 'package:movie_app_clean_architecture/domain/usecases/authentication/logout_user.dart';
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
import 'package:movie_app_clean_architecture/domain/usecases/language_usecases/get_preferred_language.dart';
import 'package:movie_app_clean_architecture/domain/usecases/language_usecases/update_language.dart';
import 'package:movie_app_clean_architecture/domain/usecases/save_movie.dart';
import 'package:movie_app_clean_architecture/domain/usecases/search_movies.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/language_bloc/language_cubit.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/loading/loading_cubit.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/login/login_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/movie_backdrop/movie_backdrop_cubit.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/movie_carousel/movie_carousel_cubit.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/movie_tabbed/movie_tabbed_cubit.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/search_movie/search_movie_cubit.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/videos/videos_bloc.dart';

import '../data/data_sources/movie_local_data_source.dart';
import '../domain/repositories/app_repository.dart';
import '../presentation/blocs/favourite/favourite_cubit.dart';

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
  getItInstance.registerLazySingleton<LanguageLocalDataSource>(
      () => LanguageLocalDataSourceImpl());
  getItInstance.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImpl());

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

  getItInstance.registerLazySingleton<UpdateLanguage>(
      () => UpdateLanguage(getItInstance()));

  getItInstance.registerLazySingleton<GetPreferredLanguage>(
      () => GetPreferredLanguage(getItInstance()));

  getItInstance
      .registerLazySingleton<LoginUser>(() => LoginUser(getItInstance()));

  getItInstance
      .registerLazySingleton<LogoutUser>(() => LogoutUser(getItInstance()));

  ///Repository
  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance(), getItInstance()));
  getItInstance.registerLazySingleton<AppRepository>(
      () => AppRepositoryImpl(getItInstance()));
  getItInstance.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(getItInstance(), getItInstance()));

  ///Bloc
  getItInstance.registerFactory(() => MovieCarouselCupid(
        getTrending: getItInstance(),
        movieBackdropCubit: getItInstance(),
        loadingCubit: getItInstance(),
      ));

  getItInstance.registerFactory(() => MovieBackdropCubit());

  getItInstance.registerFactory(() => MovieTabbedCubit(
        getPopular: getItInstance(),
        getPlayingNow: getItInstance(),
        getComingSoon: getItInstance(),
      ));

  getItInstance.registerFactory(() => MovieDetailCubit(
        getMovieDetail: getItInstance(),
        castCubit: getItInstance(),
        videosCubit: getItInstance(),
        favouriteCubit: getItInstance(),
        loadingCubit: getItInstance(),
      ));

  getItInstance.registerFactory(() => SearchMovieCubit(
        getSearchMovies: getItInstance(),
        loadingCubit: getItInstance(),
      ));

  getItInstance.registerFactory(() => FavouriteCubit(
        saveMovie: getItInstance(),
        checkIfMovieFavourite: getItInstance(),
        getFavouriteMovies: getItInstance(),
        deleteFavouriteMovie: getItInstance(),
      ));

  getItInstance.registerFactory(() => LoginCubit(
        loginUser: getItInstance(),
        logoutUser: getItInstance(),
        loadingCubit: getItInstance(),
      ));

  getItInstance.registerFactory(() => CastCubit(getCast: getItInstance()));

  getItInstance.registerFactory(() => VideosCubit(getVideos: getItInstance()));

  getItInstance.registerSingleton<LanguageCubit>(LanguageCubit(
    getPreferredLanguage: getItInstance(),
    updateLanguage: getItInstance(),
  ));

  getItInstance.registerLazySingleton<LoadingCubit>(() => LoadingCubit());
}
