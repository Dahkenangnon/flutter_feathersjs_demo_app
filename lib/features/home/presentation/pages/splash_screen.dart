import 'dart:async';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_feathersjs/flutter_feathersjs.dart';
import 'package:flutter_feathersjs/src/utils.dart';
import 'package:flutter_feathersjs_demo_app/injection_container.dart';
import 'package:flutter_feathersjs_demo_app/router.gr.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    print(context);
    Timer(Duration(seconds: 10), () {
      navigateFromSplash();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Splash screen"));
  }

  // At the app each restart, reAuth user
  Future<void> navigateFromSplash() async {
    var flutterFeathersjs = sl<FlutterFeathersjs>();
    try {
      var rep = await flutterFeathersjs.reAuthenticate();
      AutoRouter.of(context).push(
        HomeRoute(),
      );
    } on FeatherJsError catch (e) {
      if (e.type == FeatherJsErrorType.IS_AUTH_FAILED_ERROR) {
        print("IS_AUTH_FAILED_ERROR");
      }
      AutoRouter.of(context).push(
        LoginRoute(),
      );
    } catch (e) {
      // catch other error here or:
      AutoRouter.of(context).push(
        LoginRoute(),
      );
    }
  }
}
