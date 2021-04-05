import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_feathersjs/flutter_feathersjs.dart';
import 'package:flutter_feathersjs_demo_app/core/failures.dart';
import 'package:flutter_feathersjs_demo_app/core/user.dart';
import 'package:flutter_feathersjs_demo_app/core/usecase.dart';
import 'package:flutter_feathersjs_demo_app/core/util.dart' as U;
import 'package:flutter_feathersjs/src/utils.dart';

class RegisterUser implements UseCase<User, RegisterUserParams> {
  final FlutterFeathersjs flutterFeathersjs;
  RegisterUser(this.flutterFeathersjs);
  @override
  Future<Either<Failure, User>> call(RegisterUserParams params) async {
    try {
      var response = await flutterFeathersjs.scketio.create(
          serviceName: "users",
          data: {"email": params.email, "password": params.password});

      return Right(User.fromJson(response));
    } on FeatherJsError catch (e) {
      // When error is FeatherJsErrorType
      // if(e.type == FeatherJsErrorType.IS_SERVER_ERROR)
      // Check the error type as above
      return Left(Failure(msg: e.type.toString()));
    } catch (er) {
      // Catch other error
      return Left(Failure(msg: er.type.toString()));
    }
  }

  @override
  U.Utils utils;
}

class RegisterUserParams extends Equatable {
  final String email;
  final String password;

  RegisterUserParams({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
