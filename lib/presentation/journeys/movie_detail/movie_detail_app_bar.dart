import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/common/extensions/size_extensions.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_entity.dart';

import '../../../common/constants/size_constants.dart';
import '../../../domain/entities/movie_detail_entity.dart';
import '../../blocs/favourite/favourite_bloc.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  const MovieDetailAppBar({
    Key? key,
    required this.movieDetailEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Sizes.dimen_12.h,
          ),
        ),
        BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state) {
            if (state is IsFavouriteMovie) {
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<FavouriteBloc>(context).add(
                      ToggleFavouriteMovieEvent(
                          MovieEntity.fromMovieDetailEntity(movieDetailEntity),
                          state.isMovieFavourite));
                },
                child: Icon(
                  state.isMovieFavourite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.white,
                  size: Sizes.dimen_12.h,
                ),
              );
            } else {
              return Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: Sizes.dimen_12.h,
              );
            }
          },
        ),
      ],
    );
  }
}
