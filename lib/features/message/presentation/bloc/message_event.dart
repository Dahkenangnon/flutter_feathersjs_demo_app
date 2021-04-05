part of 'message_bloc.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object> get props => [];
}

class CreateMessageEvent extends MessageEvent {
  final String text;

  CreateMessageEvent({@required this.text});

  @override
  List<Object> get props => [text];
}

class GetMessageEvent extends MessageEvent {}

class UpdateMessageEvent extends MessageEvent {
  final Message message;

  UpdateMessageEvent({@required this.message});

  @override
  List<Object> get props => [message];
}
