import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/common/constants/size_constants.dart';
import 'package:movie_app_clean_architecture/common/constants/translation_constants.dart';
import 'package:movie_app_clean_architecture/common/extensions/size_extensions.dart';
import 'package:movie_app_clean_architecture/common/extensions/string_extensions.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/movie_tabbed/movie_tabbed_cubit.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/home/movie_tabbed/movie_list_view_builder.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/home/movie_tabbed/movie_tabbed_constants.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/home/movie_tabbed/tab_title_widget.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/loading/loading_circle.dart';
import 'package:movie_app_clean_architecture/presentation/widgets/app_error_widget.dart';

class MovieTabbedWidget extends StatefulWidget {
  const MovieTabbedWidget({Key? key}) : super(key: key);

  @override
  State<MovieTabbedWidget> createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  MovieTabbedCubit get movieTabbedCubit =>
      BlocProvider.of<MovieTabbedCubit>(context);
  int currentTabIndex = 0;

  @override
  void initState() {
    movieTabbedCubit.movieTabChange(currentTabIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedCubit, MovieTabbedState>(
      builder: (context, state) {
        print(state.currentTabIndex);
        return Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < MovieTabbedConstants.movieTabs.length; i++)
                  TabTitleWidget(
                    title: MovieTabbedConstants.movieTabs[i].title,
                    onTap: () => _onTabTapped(i),
                    isSelected: MovieTabbedConstants.movieTabs[i].index ==
                        state.currentTabIndex,
                  )
              ],
            ),
            if (state is MovieTabChanged)
              state.movies?.isEmpty ?? true
                  ? Expanded(
                      child: Center(
                      child: Text(
                        TranslationConstants.noMovies.t(context),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ))
                  : Expanded(
                      child: MovieListViewBuilder(
                      movies: state.movies,
                    )),
            if (state is MovieTabLoadError)
              Expanded(
                child: AppErrorWidget(
                    errorType: state.errorType,
                    onPressed: () =>
                        movieTabbedCubit.movieTabChange(state.currentTabIndex)),
              ),
            if (state is MovieTabLoading)
              Expanded(
                  child: Center(
                child: LoadingCircle(
                  size: Sizes.dimen_100.w,
                ),
              ))
          ],
        );
      },
    );
  }

  void _onTabTapped(int index) {
    movieTabbedCubit.movieTabChange(index);
  }
}
