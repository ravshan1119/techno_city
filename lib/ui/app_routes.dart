import 'package:flutter/material.dart';
import 'package:techno_city/ui/auth/auth_screen.dart';
import 'package:techno_city/ui/home/home_screen.dart';
import 'package:techno_city/ui/order/order_screen.dart';
import 'package:techno_city/ui/profil/profile_screen.dart';
import 'package:techno_city/ui/tab/tab_box.dart';
import 'package:techno_city/ui/wishlist/wishlist_screen.dart';


class RouteNames {
  static const String tabBox = "/tab_box_screen";
  static const String homeScreen = "/home_screen";
  static const String orderScreen = "/order_screen";
  static const String wishlistScreen = "/wishlist_screen";
  static const String profileScreen = "/profile_screen";
  static const String auth = "/";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.auth:
        return MaterialPageRoute(
          builder: (context) => const AuthScreen(),
        );
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteNames.orderScreen:
        return MaterialPageRoute(
          builder: (context) => const OrderScreen(),
        );
      case RouteNames.wishlistScreen:
        return MaterialPageRoute(
          builder: (context) => const WishlistScreen(),
        );
      case RouteNames.profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case RouteNames.tabBox:
        return MaterialPageRoute(
          builder: (context) =>  TabBox(),
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