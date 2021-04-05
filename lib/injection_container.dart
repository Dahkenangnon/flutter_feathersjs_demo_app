import 'package:flutter_feathersjs/flutter_feathersjs.dart';
import 'package:flutter_feathersjs_demo_app/core/util.dart';
import 'package:flutter_feathersjs_demo_app/features/account/presentation/bloc/login_bloc.dart';
import 'package:flutter_feathersjs_demo_app/features/account/presentation/bloc/register_bloc.dart';
import 'package:flutter_feathersjs_demo_app/features/account/usecases/login_user.dart';
import 'package:flutter_feathersjs_demo_app/features/account/usecases/register_user.dart';
import 'package:flutter_feathersjs_demo_app/features/message/presentation/bloc/message_bloc.dart';
import 'package:flutter_feathersjs_demo_app/features/message/usecases/create_message_usecase.dart';
import 'package:flutter_feathersjs_demo_app/features/message/usecases/get_messages_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// API_BASE_URL
/// This the default demo api url, you can change it to fit your demo api
const API_BASE_URL = "https://flutter-feathersjs.herokuapp.com";

/// Services container
final sl = GetIt.instance;

Future<void> init() async {
  ///-----------------------Blocs---------------------
  ///
  sl.registerFactory(
    () => LoginBloc(loginUser: sl()),
  );
  sl.registerFactory(
    () => RegisterBloc(registerUser: sl()),
  );
  sl.registerFactory(
    () => MessageBloc(
      createMessageUseCase: sl(),
      getMessageList: sl(),
      flutterFeathersjs: sl(),
    ),
  );

  /// USE CASES
  sl.registerLazySingleton(() => LoginUser(sl()));
  sl.registerLazySingleton(() => RegisterUser(sl()));
  sl.registerLazySingleton(() => GetMessageList(sl()));
  sl.registerLazySingleton(() => CreateMessageUseCase(sl()));

  ///-----------------------Core---------------------
  final flutterFeathersjs = FlutterFeathersjs()..init(baseUrl: API_BASE_URL);
  sl.registerLazySingleton(() => flutterFeathersjs);
  sl.registerLazySingleton(() => Utils());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
