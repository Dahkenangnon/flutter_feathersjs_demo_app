import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feathersjs_demo_app/core/user.dart';
import 'package:flutter_feathersjs_demo_app/core/util.dart';
import 'package:flutter_feathersjs_demo_app/injection_container.dart';
import 'package:flutter_feathersjs_demo_app/router.gr.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Utils utils = sl<Utils>();

  User user;

  @override
  void initState() {
    super.initState();
    user = utils.getLoggedUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        children: <Widget>[
          Text(
              "Logget as: ${user.email ?? 'User not found in local storage'}}"),
          ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(
                  MessagesRoute(),
                );
              },
              child: Text("Goto Messages Page")),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(
                  CreateMessageRoute(),
                );
              },
              child: Text("Create Message Page"))
        ],
      ),
    ));
  }
}
