import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture/common/constants/size_constants.dart';
import 'package:movie_app_clean_architecture/common/constants/translation_constants.dart';
import 'package:movie_app_clean_architecture/common/extensions/size_extensions.dart';
import 'package:movie_app_clean_architecture/common/extensions/string_extensions.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../domain/entities/video_entity.dart';

class WatchVideoScreen extends StatefulWidget {
  final WatchVideoArguments watchVideoArguments;
  const WatchVideoScreen({Key? key, required this.watchVideoArguments})
      : super(key: key);

  @override
  State<WatchVideoScreen> createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  List<VideoEntity>? _videos;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _videos = widget.watchVideoArguments.videos;
    _controller = YoutubePlayerController(
        initialVideoId: _videos![0].key,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: true,
        ));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TranslationConstants.watchTrailers.t(context)),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _controller),
        builder: (context, player) {
          return Column(
            children: [
              player,
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < _videos!.length; i++)
                      Container(
                        height: 60.h,
                        padding:
                            EdgeInsets.symmetric(vertical: Sizes.dimen_8.h),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _controller.load(_videos![i].key);
                                _controller.play();
                              },
                              child: CachedNetworkImage(
                                width: Sizes.dimen_200.w,
                                imageUrl: YoutubePlayer.getThumbnail(
                                  videoId: _videos![i].key,
                                  quality: ThumbnailQuality.high,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Sizes.dimen_8.w),
                                child: Text(
                                  _videos![i].title,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ))
            ],
          );
        },
      ),
    );
  }
}
