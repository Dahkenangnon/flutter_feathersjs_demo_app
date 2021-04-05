import 'package:flutter/material.dart';
import 'package:flutter_feathersjs_demo_app/features/account/presentation/bloc/login_bloc.dart';
import 'package:flutter_feathersjs_demo_app/features/account/presentation/bloc/register_bloc.dart';
import 'package:flutter_feathersjs_demo_app/features/message/presentation/bloc/message_bloc.dart';
import 'package:flutter_feathersjs_demo_app/router.gr.dart';
import 'injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => di.sl<MessageBloc>(),
      ),
      BlocProvider(
        create: (context) => di.sl<LoginBloc>(),
      ),
      BlocProvider(
        create: (context) => di.sl<RegisterBloc>(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      title: "Flutter Feathers Js",
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.greenAccent,
      ),
    );
  }
}
