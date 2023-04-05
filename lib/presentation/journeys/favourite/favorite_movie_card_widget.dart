import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/movie_detail/movie_detail_argument.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/movie_detail/movie_detail_screen.dart';

import '../../../common/constants/size_constants.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../../data/core/api_constants.dart';
import '../../../domain/entities/movie_entity.dart';

class FavoriteMovieCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const FavoriteMovieCardWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Sizes.dimen_8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.dimen_8.w),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailScreen(
                    movieDetailArguments: MovieDetailArguments(movie.id)),
              ));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_8.w),
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                fit: BoxFit.cover,
                width: Sizes.dimen_100.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<FavouriteBloc>(context)
                        .add(DeleteFavouriteMovieEvent(movie.id));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(Sizes.dimen_12.w),
                    child: Icon(
                      Icons.delete,
                      size: Sizes.dimen_12.h,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
