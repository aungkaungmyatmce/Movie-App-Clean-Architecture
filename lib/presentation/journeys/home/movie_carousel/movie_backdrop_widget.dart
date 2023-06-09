import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/common/constants/size_constants.dart';
import 'package:movie_app_clean_architecture/common/extensions/size_extensions.dart';
import 'package:movie_app_clean_architecture/common/screenutil/screenutil.dart';
import 'package:movie_app_clean_architecture/data/core/api_constants.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_entity.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/movie_backdrop/movie_backdrop_cubit.dart';

class MovieBackdropWidget extends StatelessWidget {
  const MovieBackdropWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FractionallySizedBox(
          alignment: Alignment.topCenter,
          heightFactor: 0.7,
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(Sizes.dimen_40.w)),
            child: FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 1,
              child: BlocBuilder<MovieBackdropCubit, MovieEntity?>(
                builder: (context, movie) {
                  return CachedNetworkImage(
                    imageUrl:
                        '${ApiConstants.BASE_IMAGE_URL}${movie?.posterPath}',
                    fit: BoxFit.fitWidth,
                  );
                },
              ),
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            width: ScreenUtil.screenWidth,
            height: 1,
            color: Colors.transparent,
          ),
        )
      ],
    );
  }
}
