import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feathersjs_demo_app/features/account/presentation/bloc/register_bloc.dart';
import 'package:flutter_feathersjs_demo_app/router.gr.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();

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
        child: BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) async {
        if (state is Registered) {
          AutoRouter.of(context).push(
            LoginRoute(),
          );
        }
      },
      builder: (context, state) {
        if (state is RegisterInitial) {
          return registerForm(context);
        } else if (state is Registered) {
          AutoRouter.of(context).push(
            LoginRoute(),
          );
          return registerForm(context);
        } else if (state is RegisterInProgess) {
          return Center(child: CircularProgressIndicator());
        } else {
          return registerForm(context);
        }
      },
    ));
  }

  Widget registerForm(BuildContext context) {
    return Card(
      child: Form(
        key: _registerFormKey,
        child: Column(
          children: <Widget>[
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
                  dispachRegister(context);
                },
                child: Text("Register")),
            ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(
                    LoginRoute(),
                  );
                },
                child: Text("Log"))
          ],
        ),
      ),
    );
  }

  void dispachRegister(BuildContext context) {
    BlocProvider.of<RegisterBloc>(context)
        .add(Register(email: email, password: password));
  }
}
