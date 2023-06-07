// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:weather_forecast_app/presentation/pages/home/details/home_details_view.dart'
    as _i2;
import 'package:weather_forecast_app/presentation/pages/home/home_view.dart'
    as _i1;
import 'package:weather_forecast_app/presentation/pages/splashscreen/splash_screen_view.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomePage.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    HomeDetailsPage.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeDetailsPage(),
      );
    },
    SplashRoutePage.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashScreenPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomePage extends _i4.PageRouteInfo<void> {
  const HomePage({List<_i4.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeDetailsPage]
class HomeDetailsPage extends _i4.PageRouteInfo<void> {
  const HomeDetailsPage({List<_i4.PageRouteInfo>? children})
      : super(
          HomeDetailsPage.name,
          initialChildren: children,
        );

  static const String name = 'HomeDetailsPage';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SplashScreenPage]
class SplashRoutePage extends _i4.PageRouteInfo<void> {
  const SplashRoutePage({List<_i4.PageRouteInfo>? children})
      : super(
          SplashRoutePage.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoutePage';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
