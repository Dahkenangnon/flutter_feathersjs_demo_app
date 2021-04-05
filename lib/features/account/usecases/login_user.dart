import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_feathersjs/flutter_feathersjs.dart';
import 'package:flutter_feathersjs_demo_app/core/failures.dart';
import 'package:flutter_feathersjs_demo_app/core/usecase.dart';
import 'package:flutter_feathersjs_demo_app/core/user.dart';
import 'package:flutter_feathersjs_demo_app/core/util.dart';
import 'package:flutter_feathersjs_demo_app/injection_container.dart';
import 'package:meta/meta.dart';
import 'package:flutter_feathersjs/src/utils.dart' as fU;

class LoginUser implements UseCase<User, Params> {
  final FlutterFeathersjs flutterFeathersjs;
  LoginUser(this.flutterFeathersjs);

  @override
  Future<Either<Failure, User>> call(Params params) async {
    // Try authenticate user
    try {
      var user = await flutterFeathersjs.authenticate(
          userName: params.email, password: params.password);

      // If all thing is ok, save user in local storage
      await utils.setLoggedUser(user);
      return Right(User.fromJson(user));
    } on fU.FeatherJsError catch (e) {
      if (e.type == fU.FeatherJsErrorType.IS_INVALID_CREDENTIALS_ERROR) {
        print("Invalid credentials");
      } else if (e.type == fU.FeatherJsErrorType.IS_INVALID_STRATEGY_ERROR) {
        print("Invalid STRA");
      } else if (e.type == fU.FeatherJsErrorType.IS_AUTH_FAILED_ERROR) {
        print("IS_AUTH_FAILED_ERROR");
      }
      print(e.type);
      print(e.message);
      return Left(Failure(msg: e.type.toString()));
    } catch (e) {
      return Left(Failure(msg: "Unknown error"));
    }
  }

  @override
  Utils utils = sl<Utils>();
}

/// Paramaters field holder
class Params extends Equatable {
  final String email;
  final String password;

  Params({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
