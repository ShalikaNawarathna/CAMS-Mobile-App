import 'package:camps_demo/home_screen.dart';
import 'package:camps_demo/login_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case 'home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return null;
    }
  }
}
