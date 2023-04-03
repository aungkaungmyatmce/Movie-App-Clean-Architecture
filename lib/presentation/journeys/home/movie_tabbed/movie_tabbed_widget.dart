import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/common/constants/translation_constants.dart';
import 'package:movie_app_clean_architecture/common/extensions/string_extensions.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/home/movie_tabbed/movie_list_view_builder.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/home/movie_tabbed/movie_tabbed_constants.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/home/movie_tabbed/tab_title_widget.dart';
import 'package:movie_app_clean_architecture/presentation/widgets/app_error_widget.dart';

class MovieTabbedWidget extends StatefulWidget {
  const MovieTabbedWidget({Key? key}) : super(key: key);

  @override
  State<MovieTabbedWidget> createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabbedBLoc =>
      BlocProvider.of<MovieTabbedBloc>(context);
  int currentTabIndex = 0;

  @override
  void initState() {
    movieTabbedBLoc.add(MovieTabChangedEvent(currentTabIndex: currentTabIndex));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
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
              state.movies.isEmpty
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
                    onPressed: () => movieTabbedBLoc.add(MovieTabChangedEvent(
                        currentTabIndex: state.currentTabIndex))),
              )
          ],
        );
      },
    );
  }

  void _onTabTapped(int index) {
    movieTabbedBLoc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}
