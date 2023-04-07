part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LogoutSuccess extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
