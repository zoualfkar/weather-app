import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/features/home_page/presentation/view/home_page.dart';
import 'package:weather_app/src/features/second_page/presentation/view/second_page.dart';

import '../../features/home_page/domain/entities/weather_day_entity.dart';

part 'router.gr.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[

    AutoRoute(
      path: '/',
      name: 'HomePageAppRouter',
      page: HomePage,
    ),

    AutoRoute(
      path: 'SecondPage',
      name: 'SecondPageAppRouter',
      page: SecondPage,
    ),

    ])
class AppRouter extends _$AppRouter {}
