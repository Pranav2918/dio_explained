import 'package:dio_explained/src/configs/routes.dart';
import 'package:dio_explained/src/presentation/common_widgets/wrong_route.dart';
import 'package:dio_explained/src/presentation/home/home_screen.dart';
import 'package:dio_explained/src/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouteHandler {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => const WrongRoute());
    }
  }
}
