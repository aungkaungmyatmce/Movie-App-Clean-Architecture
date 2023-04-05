import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final bool? adult;
  final String backdropPath;
  final int id;
  final String title;
  final String? originalLanguage;
  final String? originalTitle;
  final String overview;
  final String posterPath;
  final String? mediaType;
  final List<int>? genreIds;
  final double? popularity;
  final String releaseDate;
  final bool? video;
  final double voteAverage;
  final int? voteCount;
  MovieModel({
    required this.backdropPath,
    required this.id,
    required this.title,
    this.originalLanguage,
    this.originalTitle,
    required this.overview,
    required this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    required this.releaseDate,
    this.video,
    required this.voteAverage,
    this.voteCount,
    this.adult,
  }) : super(
          id: id,
          posterPath: posterPath,
          backdropPath: backdropPath,
          title: title,
          voteAverage: voteAverage,
          releaseDate: releaseDate,
          overview: overview,
        );

  factory MovieModel.fromJson(dynamic json) {
    return MovieModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'] ?? '',
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'] ?? '',
      mediaType: json['media_type'],
      genreIds: json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [],
      popularity: json['popularity']?.toDouble() ?? 0.0,
      releaseDate: json['release_date'] ?? '',
      video: json['video'],
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['title'] = title;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['media_type'] = mediaType;
    map['genre_ids'] = genreIds;
    map['popularity'] = popularity;
    map['release_date'] = releaseDate;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }
}
