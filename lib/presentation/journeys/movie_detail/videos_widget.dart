import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/common/constants/translation_constants.dart';
import 'package:movie_app_clean_architecture/common/extensions/string_extensions.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/videos/videos_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/watch_video/watch_video_screen.dart';

import '../../../common/constants/route_constants.dart';

class VideosWidget extends StatelessWidget {
  final VideosBloc videosBloc;

  const VideosWidget({Key? key, required this.videosBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideosBloc, VideosState>(
      bloc: videosBloc,
      builder: (context, state) {
        if (state is VideosLoaded && state.videos.iterator.moveNext()) {
          final videos = state.videos;
          return TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteList.watchTrailer);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WatchVideoScreen(
                          watchVideoArguments: WatchVideoArguments(videos)),
                    ));
              },
              child: Text(TranslationConstants.watchTrailers.t(context)));
        } else if (state is NoVideos) {
          return Container();
        }
        return Container();
      },
    );
  }
}
