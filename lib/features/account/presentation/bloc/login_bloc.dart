import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_feathersjs_demo_app/features/account/usecases/login_user.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;

  LoginBloc({@required this.loginUser}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    try {
      if (event is Login) {
        yield LoginInProgess();
        final failureOrUser = await loginUser(
            Params(email: event.email, password: event.password));
        yield* failureOrUser.fold(
          (failure) async* {
            yield LoginError(message: failure.msg);
          },
          (user) async* {
            print("User is logged");
            yield Logged();
          },
        );
      } else {
        yield LoginInitial();
      }
    } catch (e) {
      yield LoginError(message: "Unable to log user");
    }
  }
}
