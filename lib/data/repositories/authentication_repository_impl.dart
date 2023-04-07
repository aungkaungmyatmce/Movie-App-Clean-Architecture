import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/data/core/unathorised_exception.dart';
import 'package:movie_app_clean_architecture/data/data_sources/authentication_remote_data_source.dart';
import 'package:movie_app_clean_architecture/domain/entities/app_error.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../data_sources/authentication_local_data_source.dart';
import '../models/request_token_model.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;
  final AuthenticationLocalDataSource authenticationLocalDataSource;

  AuthenticationRepositoryImpl(
      this.authenticationRemoteDataSource, this.authenticationLocalDataSource);

  Future<Either<AppError, RequestTokenModel>> _getRequestToken() async {
    try {
      final response = await authenticationRemoteDataSource.getRequestToken();
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> loginUser(Map<String, dynamic> body) async {
    final Either requestTokenEitherResponse = await _getRequestToken();
    print(requestTokenEitherResponse);
    final token1 = requestTokenEitherResponse
        .getOrElse(() => RequestTokenModel())
        .requestToken;
    try {
      body.putIfAbsent('request_token', () => token1);
      final validateWithLoginToken =
          await authenticationRemoteDataSource.validateWithLogin(body);
      final sessionId = await authenticationRemoteDataSource
          .createSession(validateWithLoginToken.toJson());
      print(sessionId);
      if (sessionId != null && sessionId.isNotEmpty) {
        await authenticationLocalDataSource.saveSessionId(sessionId);
        return Right(true);
      }
      return Left(AppError(AppErrorType.sessionDenied));
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorisedException {
      return Left(AppError(AppErrorType.unauthorized));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, void>> logoutUser() async {
    final sessionId = await authenticationLocalDataSource.getSessionId();
    if (sessionId != null) {
      await Future.wait([
        authenticationRemoteDataSource.deleteSession(sessionId),
        authenticationLocalDataSource.deleteSessionId(),
      ]);
    }
    print(await authenticationLocalDataSource.getSessionId());
    return Right(Unit);
  }
}
