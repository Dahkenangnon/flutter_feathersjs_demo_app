import 'package:dartz/dartz.dart';
import 'package:flutter_feathersjs/flutter_feathersjs.dart';
import 'package:flutter_feathersjs_demo_app/core/failures.dart';
import 'package:flutter_feathersjs_demo_app/core/message.dart';
import 'package:flutter_feathersjs_demo_app/core/usecase.dart';
import 'package:flutter_feathersjs_demo_app/core/util.dart' as U;
import 'package:flutter_feathersjs/src/utils.dart';

class GetMessageList implements UseCase<List<Message>, NoParams> {
  final FlutterFeathersjs flutterFeathersjs;

  GetMessageList(this.flutterFeathersjs);
  @override
  Future<Either<Failure, List<Message>>> call(NoParams params) async {
    try {
      var response = await flutterFeathersjs.scketio
          .find(serviceName: "message", query: {});
      //
      var messageListData = response["data"];
      var messageList = [];
      for (var message in messageListData) {
        messageList.add(Message.fromJson(message));
      }
      return Right(messageList);
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
