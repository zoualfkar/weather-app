import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/app/logic/app_settings.dart';
import 'package:weather_app/src/app/widget/app.dart';
import 'package:weather_app/src/core/utils/managers/database/database_manager.dart';
import 'package:weather_app/src/core/utils/managers/graphql/graphql_manger.dart';
import 'package:weather_app/src/injections.dart';

import 'src/app/logic/app_bloc.dart';
import 'src/injections.dart' as injections;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await injections.init();
  await serviceLocator<DatabaseManager>().openBox();
  await serviceLocator<AppBloc>().init();
  await serviceLocator<GraphQlManger>().init();

  final bool isConnected = serviceLocator<AppSettings>().hasConnection ?? false;


  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'SY')
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      // startLocale: const Locale('ar', 'SY'),
      child: const MyApp(),
    ),
  );
}