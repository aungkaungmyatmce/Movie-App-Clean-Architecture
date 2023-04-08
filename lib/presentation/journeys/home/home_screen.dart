import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/di/get_it.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/movie_backdrop/movie_backdrop_cubit.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/movie_carousel/movie_carousel_cubit.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/movie_tabbed/movie_tabbed_cubit.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/search_movie/search_movie_cubit.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/home/movie_tabbed/movie_tabbed_widget.dart';
import '../drawer/navigation_drawer.dart';
import '../../widgets/app_error_widget.dart';
import 'movie_carousel/movie_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselCupid movieCarouselCupid;
  late MovieBackdropCubit movieBackdropCubit;
  late MovieTabbedCubit movieTabbedCubit;
  late SearchMovieCubit searchMovieCubit;

  @override
  void initState() {
    movieCarouselCupid = getItInstance<MovieCarouselCupid>();
    movieBackdropCubit = movieCarouselCupid.movieBackdropCubit;
    movieTabbedCubit = getItInstance<MovieTabbedCubit>();
    searchMovieCubit = getItInstance<SearchMovieCubit>();
    movieCarouselCupid.loadCarousel();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselCupid.close();
    movieBackdropCubit.close();
    movieTabbedCubit.close();
    searchMovieCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => movieCarouselCupid),
        BlocProvider(create: (context) => movieBackdropCubit),
        BlocProvider(create: (context) => movieTabbedCubit),
        BlocProvider(create: (context) => searchMovieCubit),
      ],
      child: Scaffold(
        drawer: const NavDrawer(),
        body: BlocBuilder<MovieCarouselCupid, MovieCarouselState>(
          bloc: movieCarouselCupid,
          builder: (context, state) {
            if (state is MovieCarouselLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.6,
                    child: MovieCarouselWidget(
                      movies: state.movies,
                      defaultIndex: state.defaultIndex,
                    ),
                  ),
                  FractionallySizedBox(
                      alignment: Alignment.bottomCenter,
                      heightFactor: 0.4,
                      child: MovieTabbedWidget()),
                ],
              );
            } else if (state is MovieCarouselError) {
              return AppErrorWidget(
                errorType: state.errorType,
                onPressed: () => movieCarouselCupid.loadCarousel(),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
