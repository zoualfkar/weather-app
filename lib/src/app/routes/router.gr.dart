// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomePageAppRouter.name: (routeData) {
      return CupertinoPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    SecondPageAppRouter.name: (routeData) {
      final args = routeData.argsAs<SecondPageAppRouterArgs>();
      return CupertinoPageX<dynamic>(
          routeData: routeData,
          child: SecondPage(
              weatherDayEntity: args.weatherDayEntity, key: args.key));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomePageAppRouter.name, path: '/'),
        RouteConfig(SecondPageAppRouter.name, path: 'SecondPage')
      ];
}

/// generated route for
/// [HomePage]
class HomePageAppRouter extends PageRouteInfo<void> {
  const HomePageAppRouter() : super(HomePageAppRouter.name, path: '/');

  static const String name = 'HomePageAppRouter';
}

/// generated route for
/// [SecondPage]
class SecondPageAppRouter extends PageRouteInfo<SecondPageAppRouterArgs> {
  SecondPageAppRouter({required WeatherDayEntity weatherDayEntity, Key? key})
      : super(SecondPageAppRouter.name,
            path: 'SecondPage',
            args: SecondPageAppRouterArgs(
                weatherDayEntity: weatherDayEntity, key: key));

  static const String name = 'SecondPageAppRouter';
}

class SecondPageAppRouterArgs {
  const SecondPageAppRouterArgs({required this.weatherDayEntity, this.key});

  final WeatherDayEntity weatherDayEntity;

  final Key? key;

  @override
  String toString() {
    return 'SecondPageAppRouterArgs{weatherDayEntity: $weatherDayEntity, key: $key}';
  }
}
