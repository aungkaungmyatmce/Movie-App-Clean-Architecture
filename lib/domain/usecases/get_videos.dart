import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_entity.dart';
import 'package:movie_app_clean_architecture/domain/entities/no_params.dart';
import 'package:movie_app_clean_architecture/domain/entities/video_entity.dart';
import 'package:movie_app_clean_architecture/domain/repositories/movie_repository.dart';
import 'package:movie_app_clean_architecture/domain/usecases/usecase.dart';
import '../entities/app_error.dart';
import '../entities/movie_params.dart';

class GetVideos extends UseCase<List<VideoEntity>, MovieParams> {
  final MovieRepository repository;
  GetVideos(this.repository);

  @override
  Future<Either<AppError, List<VideoEntity>>> call(MovieParams params) async {
    return await repository.getVideos(params.id);
  }
}
