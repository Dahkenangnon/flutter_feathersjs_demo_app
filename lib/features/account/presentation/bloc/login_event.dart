part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

/// Event to fire when user want to be connected
class Login extends LoginEvent {
  final String email;
  final String password;

  Login({@required this.email, @required this.password});
  @override
  List<Object> get props => [email, password];
}
