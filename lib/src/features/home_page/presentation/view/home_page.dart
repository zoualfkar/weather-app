import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/features/home_page/presentation/logic/home_cubit.dart';
import 'package:weather_app/src/injections.dart';

import 'home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context)=> serviceLocator<HomeCubit>(),
        child: const HomeBody(),
      ),
    );
  }
}
