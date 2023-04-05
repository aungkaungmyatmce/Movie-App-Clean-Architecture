part of 'videos_bloc.dart';

abstract class VideosEvent extends Equatable {
  const VideosEvent();
}

class LoadVideosEvent extends VideosEvent {
  final int movieId;

  LoadVideosEvent({required this.movieId});

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}
