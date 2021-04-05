part of 'message_bloc.dart';

abstract class MessageState extends Equatable {
  const MessageState();

  @override
  List<Object> get props => [];
}

class MessageInitial extends MessageState {}

class MessageDataIsComing extends MessageState {
  final Message message;

  MessageDataIsComing({@required this.message});

  @override
  List<Object> get props => [message];
}

class MessageLoaded extends MessageState {
  final List<Message> messageList;

  MessageLoaded({@required this.messageList});

  @override
  List<Object> get props => [messageList];
}

class MessageCreated extends MessageState {}

class MessageEmptyLoaded extends MessageState {}

class MessageInProgress extends MessageState {}

class MessageError extends MessageState {
  final String message;

  MessageError({@required this.message});

  @override
  List<Object> get props => [message];
}
