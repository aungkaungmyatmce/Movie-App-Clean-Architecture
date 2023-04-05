import 'package:equatable/equatable.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_detail_entity.dart';

class MovieEntity extends Equatable {
  final int id;
  final String posterPath;
  final String backdropPath;
  final String title;
  final num voteAverage;
  final String releaseDate;
  final String overview;

  MovieEntity(
      {required this.id,
      required this.posterPath,
      required this.backdropPath,
      required this.title,
      required this.voteAverage,
      required this.releaseDate,
      required this.overview})
      : assert(id != null, 'Movie must not equal to null');

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, posterPath];

  @override
  bool get stringify => true;

  factory MovieEntity.fromMovieDetailEntity(
      MovieDetailEntity movieDetailEntity) {
    return MovieEntity(
      id: movieDetailEntity.id,
      posterPath: movieDetailEntity.posterPath,
      backdropPath: movieDetailEntity.backdropPath,
      title: movieDetailEntity.title,
      voteAverage: movieDetailEntity.voteAverage,
      releaseDate: movieDetailEntity.releaseDate,
      overview: movieDetailEntity.overview,
    );
  }
}
