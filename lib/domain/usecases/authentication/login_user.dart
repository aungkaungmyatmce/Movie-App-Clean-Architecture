import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/domain/entities/app_error.dart';
import 'package:movie_app_clean_architecture/domain/repositories/authentication_repository.dart';
import 'package:movie_app_clean_architecture/domain/usecases/usecase.dart';

import '../../entities/login_request_params.dart';

class LoginUser extends UseCase<bool, LoginRequestParams> {
  final AuthenticationRepository authenticationRepository;

  LoginUser(this.authenticationRepository);
  @override
  Future<Either<AppError, bool>> call(LoginRequestParams params) {
    return authenticationRepository.loginUser(params.toJson());
  }
}
