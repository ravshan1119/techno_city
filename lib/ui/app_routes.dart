import 'package:flutter/material.dart';
import 'package:techno_city/ui/auth/auth_screen.dart';
import 'package:techno_city/ui/tab/tab_box.dart';


class RouteNames {
  static const String tabBox = "/tab_box_screen";
  static const String auth = "/";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.auth:
        return MaterialPageRoute(
          builder: (context) => const AuthScreen(),
        );
      case RouteNames.tabBox:
        return MaterialPageRoute(
          builder: (context) => const TabBox(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not found!"),
            ),
          ),
        );
    }
  }
}