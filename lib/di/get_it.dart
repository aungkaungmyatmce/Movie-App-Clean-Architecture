import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app_clean_architecture/common/constants/languages.dart';
import 'package:movie_app_clean_architecture/data/core/api_client.dart';
import 'package:movie_app_clean_architecture/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app_clean_architecture/data/repositories/movie_repository_impl.dart';
import 'package:movie_app_clean_architecture/domain/repositories/movie_repository.dart';
import 'package:movie_app_clean_architecture/domain/usecases/get_coming_soon.dart';
import 'package:movie_app_clean_architecture/domain/usecases/get_playing_now.dart';
import 'package:movie_app_clean_architecture/domain/usecases/get_popular.dart';
import 'package:movie_app_clean_architecture/domain/usecases/get_trending.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));

  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));

  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));

  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));

  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()));

  getItInstance
      .registerFactory(() => MovieCarouselBloc(getTrending: getItInstance()));

  getItInstance.registerFactory(() => MovieBackdropBloc());

  getItInstance.registerFactory(() => MovieTabbedBloc(
        getPopular: GetPopular(getItInstance()),
        getPlayingNow: GetPlayingNow(getItInstance()),
        getComingSoon: GetComingSoon(getItInstance()),
      ));

  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());
}
