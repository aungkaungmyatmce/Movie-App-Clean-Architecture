import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/common/extensions/size_extensions.dart';
import 'package:movie_app_clean_architecture/common/extensions/string_extensions.dart';
import 'package:movie_app_clean_architecture/di/get_it.dart';
import 'package:movie_app_clean_architecture/domain/entities/app_error.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/videos/videos_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/movie_detail/movie_detail_argument.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/movie_detail/videos_widget.dart';
import 'package:movie_app_clean_architecture/presentation/widgets/app_error_widget.dart';

import '../../../common/constants/size_constants.dart';
import '../../../common/constants/translation_constants.dart';
import 'big_poster.dart';
import 'cast_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({Key? key, required this.movieDetailArguments})
      : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailBloc _movieDetailBloc;
  late CastBloc _castBloc;
  late VideosBloc _videosBloc;
  late FavouriteBloc _favouriteBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    _castBloc = _movieDetailBloc.castBloc;
    _videosBloc = _movieDetailBloc.videosBloc;
    _favouriteBloc = _movieDetailBloc.favouriteBloc;
    _movieDetailBloc
        .add(MovieDetailLoadEvent(widget.movieDetailArguments.movieId));
  }

  @override
  void dispose() {
    _movieDetailBloc.close();
    _castBloc.close();
    _videosBloc.close();
    _favouriteBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _movieDetailBloc),
          BlocProvider.value(value: _castBloc),
          BlocProvider.value(value: _videosBloc),
          BlocProvider.value(value: _favouriteBloc),
        ],
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailEntity;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BigPoster(
                      movie: movieDetail,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_16.w,
                        vertical: Sizes.dimen_8.h,
                      ),
                      child: Text(
                        movieDetail.overview ?? '',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Sizes.dimen_16.w,
                          vertical: Sizes.dimen_8.h),
                      child: Text(
                        TranslationConstants.cast.t(context),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    CastWidget(),
                    VideosWidget(videosBloc: _videosBloc),
                  ],
                ),
              );
            } else if (state is MovieDetailError) {
              return AppErrorWidget(
                  errorType: AppErrorType.network, onPressed: () {});
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
