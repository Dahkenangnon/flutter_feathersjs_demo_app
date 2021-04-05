// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;

import 'features/account/presentation/pages/login.dart' as _i7;
import 'features/account/presentation/pages/register.dart' as _i6;
import 'features/home/presentation/pages/Home.dart' as _i3;
import 'features/home/presentation/pages/splash_screen.dart' as _i2;
import 'features/message/presentation/pages/create_message.dart' as _i5;
import 'features/message/presentation/pages/message_page.dart' as _i4;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashScreenRoute.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry,
          child: _i2.SplashScreenPage(),
          maintainState: true,
          fullscreenDialog: false);
    },
    HomeRoute.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry,
          child: _i3.HomePage(),
          maintainState: true,
          fullscreenDialog: false);
    },
    MessagesRoute.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry,
          child: _i4.MessagesPage(),
          maintainState: true,
          fullscreenDialog: false);
    },
    CreateMessageRoute.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry,
          child: _i5.CreateMessagePage(),
          maintainState: true,
          fullscreenDialog: false);
    },
    RegisterRoute.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry,
          child: _i6.RegisterPage(),
          maintainState: true,
          fullscreenDialog: false);
    },
    LoginRoute.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry,
          child: _i7.LoginPage(),
          maintainState: true,
          fullscreenDialog: false);
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashScreenRoute.name,
            path: '/', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(HomeRoute.name,
            path: '/home-page', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(MessagesRoute.name,
            path: '/messages-page', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(CreateMessageRoute.name,
            path: '/create-message-page',
            fullMatch: false,
            usesTabsRouter: false),
        _i1.RouteConfig(RegisterRoute.name,
            path: '/register-page', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(LoginRoute.name,
            path: '/login-page', fullMatch: false, usesTabsRouter: false)
      ];
}

class SplashScreenRoute extends _i1.PageRouteInfo {
  const SplashScreenRoute() : super(name, path: '/');

  static const String name = 'SplashScreenRoute';
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/home-page');

  static const String name = 'HomeRoute';
}

class MessagesRoute extends _i1.PageRouteInfo {
  const MessagesRoute() : super(name, path: '/messages-page');

  static const String name = 'MessagesRoute';
}

class CreateMessageRoute extends _i1.PageRouteInfo {
  const CreateMessageRoute() : super(name, path: '/create-message-page');

  static const String name = 'CreateMessageRoute';
}

class RegisterRoute extends _i1.PageRouteInfo {
  const RegisterRoute() : super(name, path: '/register-page');

  static const String name = 'RegisterRoute';
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/login-page');

  static const String name = 'LoginRoute';
}
