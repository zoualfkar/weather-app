
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/src/features/home_page/data/data_source/remote/home_data_source.dart';
import 'package:weather_app/src/features/home_page/data/repositories/home_page_repository_impl.dart';
import 'package:weather_app/src/features/home_page/domain/repositories/home_page_repository.dart';
import 'package:weather_app/src/features/home_page/domain/use_case/get_weather.dart';
import 'package:weather_app/src/features/home_page/presentation/logic/home_cubit.dart';

import 'app/logic/app_bloc.dart';
import 'app/logic/app_settings.dart';
import 'app/routes/router.dart';
import 'core/utils/managers/database/database_manager.dart';
import 'core/utils/managers/graphql/graphql_manger.dart';
import 'core/utils/managers/http/domain_lookup.dart';
import 'core/utils/managers/http/http_manager.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  initInjections(serviceLocator);
  serviceLocator.allowReassignment = true;
}

void initInjections(GetIt serviceLocator) {
  //! Utls
  serviceLocator.registerLazySingleton<DomainLookup>(
        () => DomainLookupImpl(),
  );

  serviceLocator.registerLazySingleton<AppSettings>(
        () => AppSettings(databaseManager: serviceLocator()),
  );


  //! App

  //* Logic
  serviceLocator.registerLazySingleton<AppBloc>(
        () => AppBloc(domainLookup: serviceLocator()),
  );

  //* Router
  serviceLocator.registerLazySingleton<AppRouter>(
        () => AppRouter(),
  );

  //! core

  //* Database
  serviceLocator.registerLazySingleton<DatabaseManager>(
        () => DatabaseManagerImpl(),
  );

  //* Network
  serviceLocator.registerLazySingleton<BaseOptions>(
        () =>
        BaseOptions(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            "charset": "utf-8",
            "Accept-Charset": "utf-8",
          },
          responseType: ResponseType.plain,
        ),
  );

  serviceLocator.registerLazySingleton<HttpManager>(
        () =>
        HttpManagerImpl(
          baseOptions: serviceLocator(),
          databaseManager: serviceLocator(),
        ),
  );

  serviceLocator.registerLazySingleton<GraphQlManger>(
        () => GraphQlManger(),
  );




  /// home feature

  // data source
  serviceLocator.registerFactory<HomeDataSource>(
        () => HomeDataSourceImpl(httpManager: serviceLocator()),
  );

  // repository
  serviceLocator.registerFactory<HomeRepository>(
        () => HomeRepositoryImpl(homeDataSource: serviceLocator()),
  );

  // user case
  serviceLocator.registerFactory<GetWeather>(
        () => GetWeather(repository: serviceLocator()),
  );

  // bloc
  serviceLocator.registerFactory<HomeCubit>(
        () => HomeCubit(getWeather: serviceLocator()),
  );
}