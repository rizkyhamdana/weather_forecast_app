import 'package:auto_route/auto_route.dart';
import 'package:weather_forecast_app/presentation/pages/splashscreen/splash_screen_view.dart';

import 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        //HomeScreen is generated as HomeRoute because
        //of the replaceInRouteName property
        AutoRoute(page: SplashRoutePage.page, initial: true),
        AutoRoute(page: HomePage.page),
        AutoRoute(page: HomeDetailsPage.page),
      ];
}
