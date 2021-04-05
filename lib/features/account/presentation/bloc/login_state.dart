part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

/// Nothing is done
class LoginInitial extends LoginState {}

/// Encounter an error
class LoginError extends LoginState {
  final String message;

  LoginError({@required this.message});

  @override
  List<Object> get props => [message];
}

class LoginInProgess extends LoginState {}

/// Logged with success
class Logged extends LoginState {}

class ReLogged extends LoginState {}

class ReLoggedFailed extends LoginState {}
