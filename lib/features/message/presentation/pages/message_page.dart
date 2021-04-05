import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feathersjs_demo_app/core/message.dart';
import 'package:flutter_feathersjs_demo_app/features/message/presentation/bloc/message_bloc.dart';

class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  List<Message> messageList = [];
  void loadMessageEvent(BuildContext context) {
    BlocProvider.of<MessageBloc>(context).add(GetMessageEvent());
  }

  @override
  void initState() {
    super.initState();
    loadMessageEvent(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: BlocConsumer<MessageBloc, MessageState>(
      listener: (context, state) async {
        if (state is MessageDataIsComing) {
          // Method 1: Add this message  to the list and update the ui
          setState(() {
            messageList.insert(0, state.message);
          });

          // Fire loadMessage to load messages
          loadMessageEvent(context);
        }
      },
      builder: (context, state) {
        if (state is MessageInitial) {
          return Center(child: Text("Nothing to display"));
        } else if (state is MessageCreated) {
          return buildMessageList(context);
        } else if (state is MessageInProgress) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MessageError) {
          return Center(child: Text(state.message));
        } else {
          return buildMessageList(context);
        }
      },
    ));
  }

  Widget buildMessageList(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: messageList.length,
      itemBuilder: (BuildContext context, int index) {
        Message message = messageList[index];
        return Container(
          height: 50,
          color: Colors.green,
          child: Center(
              child: Row(
            children: [
              Text('_id: ${message.id}'),
              Text('text: ${message.text}')
            ],
          )),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
