import 'package:flutter/material.dart';

import 'core/utils/route_util.dart';
import 'core/utils/strings_util.dart';
import 'feature/login/presentation/screen/login_screen.dart';
import 'feature/splash_screen/presentation/screen/splash_screen.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteUtil.splashRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, __, ___) => SplashScreen(),
          settings: RouteSettings(name: settings.name),
          transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
              FadeTransition(opacity: a, child: c),
        );

      case RouteUtil.loginRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, __, ___) => LoginScreen(),
          settings: RouteSettings(name: settings.name),
          transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
              FadeTransition(opacity: a, child: c),
        );

      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('${Strings.noRouteDefinedFor} ${settings.name}'),
            ),
          ),
        );
    }
  }
}
