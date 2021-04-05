import 'package:auto_route/auto_route.dart';
import 'package:flutter_feathersjs_demo_app/features/account/presentation/pages/login.dart';
import 'package:flutter_feathersjs_demo_app/features/account/presentation/pages/register.dart';
import 'package:flutter_feathersjs_demo_app/features/home/presentation/pages/Home.dart';
import 'package:flutter_feathersjs_demo_app/features/home/presentation/pages/splash_screen.dart';
import 'package:flutter_feathersjs_demo_app/features/message/presentation/pages/create_message.dart';
import 'package:flutter_feathersjs_demo_app/features/message/presentation/pages/message_page.dart';

///
/// Define routes
///
@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  // Initial route
  AutoRoute(page: SplashScreenPage, initial: true),
  AutoRoute(page: HomePage),
  AutoRoute(page: MessagesPage),
  AutoRoute(page: CreateMessagePage),
  AutoRoute(page: RegisterPage),
  AutoRoute(page: LoginPage),
])
class $AppRouter {}
