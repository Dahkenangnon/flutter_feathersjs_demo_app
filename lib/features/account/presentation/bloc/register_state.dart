part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class Registered extends RegisterState {}

class RegisterInProgess extends RegisterState {}

/// Encounter an error
class RegisterError extends RegisterState {
  final String message;

  RegisterError({@required this.message});

  @override
  List<Object> get props => [message];
}
