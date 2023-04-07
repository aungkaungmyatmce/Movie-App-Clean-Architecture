import 'package:flutter/cupertino.dart';
import 'package:movie_app_clean_architecture/common/constants/route_constants.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/home/home_screen.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/loading/loading_screen.dart';
import 'journeys/favourite/favourite_screen.dart';
import 'journeys/login/login_screen.dart';
import 'journeys/movie_detail/movie_detail_argument.dart';
import 'journeys/movie_detail/movie_detail_screen.dart';
import 'journeys/watch_video/watch_video_arguments.dart';
import 'journeys/watch_video/watch_video_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteList.initial: (context) => LoginScreen(),
        RouteList.home: (context) => HomeScreen(),
        RouteList.movieDetail: (context) => MovieDetailScreen(
              movieDetailArguments: setting.arguments as MovieDetailArguments,
            ),
        RouteList.watchTrailer: (context) => WatchVideoScreen(
              watchVideoArguments: setting.arguments as WatchVideoArguments,
            ),
        RouteList.favorite: (context) => FavouriteScreen(),
      };
}
