import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feathersjs_demo_app/features/message/presentation/bloc/message_bloc.dart';
import 'package:flutter_feathersjs_demo_app/router.gr.dart';

class CreateMessagePage extends StatefulWidget {
  @override
  _CreateMessagePageState createState() => _CreateMessagePageState();
}

class _CreateMessagePageState extends State<CreateMessagePage> {
  final _messageFormKey = GlobalKey<FormState>();

  String text;

  @override
  void initState() {
    super.initState();
    text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: BlocConsumer<MessageBloc, MessageState>(
      listener: (context, state) async {
        if (state is MessageCreated) {
          AutoRouter.of(context).push(
            MessagesRoute(),
          );
        }
      },
      builder: (context, state) {
        if (state is MessageInitial) {
          return messageForm(context);
        } else if (state is MessageCreated) {
          return messageForm(context);
        } else if (state is MessageInProgress) {
          return Center(child: CircularProgressIndicator());
        } else {
          return messageForm(context);
        }
      },
    ));
  }

  Widget messageForm(BuildContext context) {
    return Form(
      key: _messageFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(hintText: "Write some message..."),
            onChanged: (val) {
              setState(() {
                text = val;
              });
            },
          ),
          ElevatedButton(
              onPressed: () {
                dispachMessage(context);
              },
              child: Text("Message"))
        ],
      ),
    );
  }

  void dispachMessage(BuildContext context) {
    BlocProvider.of<MessageBloc>(context).add(CreateMessageEvent(text: text));
  }
}
