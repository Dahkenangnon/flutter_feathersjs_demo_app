import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_feathersjs/flutter_feathersjs.dart';
import 'package:flutter_feathersjs_demo_app/core/failures.dart';
import 'package:flutter_feathersjs_demo_app/core/message.dart';
import 'package:flutter_feathersjs_demo_app/core/usecase.dart';
import 'package:flutter_feathersjs_demo_app/core/util.dart' as U;
import 'package:flutter_feathersjs/src/utils.dart';

class CreateMessageUseCase implements UseCase<Message, MessageParams> {
  final FlutterFeathersjs flutterFeathersjs;
  CreateMessageUseCase(this.flutterFeathersjs);
  @override
  Future<Either<Failure, Message>> call(MessageParams params) async {
    try {
      var response = await flutterFeathersjs.scketio
          .create(serviceName: "message", data: {"text": params.text});

      return Right(Message.fromJson(response));
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

class MessageParams extends Equatable {
  final String text;

  MessageParams({@required this.text});

  @override
  List<Object> get props => [text];
}
