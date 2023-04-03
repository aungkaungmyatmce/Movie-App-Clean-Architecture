import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app_clean_architecture/data/core/api_client.dart';
import 'package:movie_app_clean_architecture/data/core/api_constants.dart';
import 'package:movie_app_clean_architecture/data/models/movie_model.dart';
import 'package:movie_app_clean_architecture/data/models/movies_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrendingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;
  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await _client.get('trending/all/day');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies!;
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies!;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies!;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get('movie/now_playing');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies!;
  }
}
