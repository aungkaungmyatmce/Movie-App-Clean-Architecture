import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/common/constants/translation_constants.dart';
import 'package:movie_app_clean_architecture/common/extensions/string_extensions.dart';
import 'package:movie_app_clean_architecture/di/get_it.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/favourite/favourite_cubit.dart';

import 'favorite_movie_grid_view.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late FavouriteCubit _favouriteBloc;

  @override
  void initState() {
    super.initState();
    _favouriteBloc = getItInstance<FavouriteCubit>();
    _favouriteBloc.loadFavouriteMovies();
  }

  @override
  void dispose() {
    super.dispose();
    _favouriteBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TranslationConstants.favoriteMovies.t(context)),
      ),
      body: BlocProvider.value(
          value: _favouriteBloc,
          child: BlocBuilder<FavouriteCubit, FavouriteState>(
            builder: (context, state) {
              if (state is FavouriteMoviesLoaded) {
                if (state.movies.isEmpty) {
                  return Center(
                    child: Text(
                      TranslationConstants.noFavoriteMovie.t(context),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  );
                }
                return FavoriteMovieGridView(
                  movies: state.movies,
                );
              }
              return Container();
            },
          )),
    );
  }
}
