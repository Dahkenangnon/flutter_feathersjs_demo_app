import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_feathersjs/flutter_feathersjs.dart';
import 'package:flutter_feathersjs_demo_app/core/message.dart';
import 'package:flutter_feathersjs_demo_app/core/usecase.dart';
import 'package:flutter_feathersjs_demo_app/features/message/usecases/create_message_usecase.dart';
import 'package:flutter_feathersjs_demo_app/features/message/usecases/get_messages_usecase.dart';
import 'package:meta/meta.dart';
part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final CreateMessageUseCase createMessageUseCase;
  final GetMessageList getMessageList;
  final FlutterFeathersjs flutterFeathersjs;

  StreamSubscription streamSubscription;

  MessageBloc(
      {this.createMessageUseCase, this.getMessageList, this.flutterFeathersjs})
      : super(MessageInitial()) {
    // Listen to realtime event
    streamSubscription = flutterFeathersjs.scketio
        .listen<Message>(serviceName: "message", fromJson: Message.fromMap)
        .listen((event) {
      add(UpdateMessageEvent(message: event));
    });
  }

  @override
  Stream<MessageState> mapEventToState(
    MessageEvent event,
  ) async* {
    try {
      if (event is UpdateMessageEvent) {
        yield MessageDataIsComing(message: event.message);
      } else if (event is CreateMessageEvent) {
        yield MessageInProgress();
        final failureOrMessage =
            await createMessageUseCase(MessageParams(text: event.text));

        yield* failureOrMessage.fold(
          (failure) async* {
            yield MessageError(message: "Error creating message");
          },
          (message) async* {
            yield MessageCreated();
          },
        );
      } else if (event is GetMessageList) {
        yield MessageInProgress();
        final failureOrMessages = await getMessageList(NoParams());

        yield* failureOrMessages.fold(
          (failure) async* {
            yield MessageError(message: "Error retriving message list");
          },
          (messages) async* {
            yield MessageLoaded(messageList: messages);
          },
        );
      } else {
        yield MessageInitial();
      }
    } catch (e) {
      yield MessageError(message: "Error");
    }
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
