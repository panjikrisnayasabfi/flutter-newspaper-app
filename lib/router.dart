import 'package:flutter/material.dart';

import 'package:flutter_newspaper_app/feature/home/data/homeuserdata.dart';

import 'package:flutter_newspaper_app/feature/detail_news_screen/presentation/screen/detail_news_screen.dart';
import 'package:flutter_newspaper_app/feature/home/presentation/screen/home_screen.dart';

import 'core/utils/route_util.dart';
import 'core/utils/strings_util.dart';
import 'feature/login/presentation/screen/login_screen.dart';
import 'feature/splash_screen/presentation/screen/splash_screen.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home-route':
        final Homeduserdata? homeduserdata =
            settings.arguments as Homeduserdata;
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) =>
                HomeScreen(homeduserdata: homeduserdata),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

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

      case RouteUtil.detailNewsRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, __, ___) => DetailNewsScreen(),
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
