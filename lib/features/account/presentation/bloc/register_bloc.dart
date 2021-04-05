import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_feathersjs_demo_app/features/account/usecases/register_user.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUser registerUser;

  RegisterBloc({this.registerUser}) : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    try {
      if (event is Register) {
        yield RegisterInProgess();
        final failureOrUser = await registerUser(
            RegisterUserParams(email: event.email, password: event.password));

        yield* failureOrUser.fold(
          (failure) async* {
            yield RegisterError(message: failure.msg);
          },
          (user) async* {
            yield Registered();
          },
        );
      } else {
        /// By default sent initial state
        yield RegisterInitial();
      }
    } catch (e) {
      print("RegisterError in register bloc");
      print(e);
      yield RegisterError(message: "Une erreur non attrapée.");
    }
  }
}
