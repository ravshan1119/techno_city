import 'package:flutter/material.dart';
import 'package:techno_city/ui/home/home_screen.dart';
import 'package:techno_city/ui/order/order_screen.dart';
import 'package:techno_city/ui/profil/profile_screen.dart';
import 'package:techno_city/ui/wishlist/wishlist_screen.dart';

class TabBoxProvider extends ChangeNotifier {
  int _currentScreen = 0;

  TabBoxProvider();

  List<Widget> screens = [
    HomeScreen(),
    WishlistScreen(),
    OrderScreen(),
    ProfileScreen()
  ];

  get getCurrentScreen=>_currentScreen;

  setCurrentScreen(int currentIndex){
    _currentScreen=currentIndex;
    notifyListeners();
  }
}
