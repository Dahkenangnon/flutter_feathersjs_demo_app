import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feathersjs_demo_app/features/account/presentation/bloc/login_bloc.dart';
import 'package:flutter_feathersjs_demo_app/router.gr.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  String email;
  String password;

  @override
  void initState() {
    super.initState();
    email = '';
    password = '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state is Logged) {
          print("User is logged");
          AutoRouter.of(context).push(
            HomeRoute(),
          );
        }
      },
      builder: (context, state) {
        if (state is LoginInitial) {
          return loginForm(context);
        } else if (state is Logged) {
          print("User is logged");
          AutoRouter.of(context).push(
            HomeRoute(),
          );
          return loginForm(context);
        } else if (state is LoginInProgess) {
          return Center(child: CircularProgressIndicator());
        } else {
          return loginForm(context);
        }
      },
    ));
  }

  Widget loginForm(BuildContext context) {
    return Card(
      child: Form(
        key: _loginFormKey,
        child: Column(
          children: <Widget>[
            // Add TextFormFields and ElevatedButton here.
            //
            //
            TextFormField(
              decoration: InputDecoration(hintText: "Email..."),
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(hintText: "Password..."),
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  dispachLogin(context);
                },
                child: Text("Login")),
            ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(
                    RegisterRoute(),
                  );
                },
                child: Text("Signup"))
          ],
        ),
      ),
    );
  }

  void dispachLogin(BuildContext context) {
    BlocProvider.of<LoginBloc>(context)
        .add(Login(email: email, password: password));
  }
}
