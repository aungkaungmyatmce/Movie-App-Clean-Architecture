part of 'cast_bloc.dart';

abstract class CastEvent extends Equatable {
  const CastEvent();
}

class LoadCastEvent extends CastEvent {
  final int movieId;

  LoadCastEvent({required this.movieId});

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}
