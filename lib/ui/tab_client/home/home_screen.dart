import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techno_city/ui/tab/home/widgets/add_category.dart';
import 'package:techno_city/ui/tab/home/widgets/category_list_page.dart';
import 'package:techno_city/utils/app_colors.dart';
class HomeScreenClient extends StatefulWidget {
  const HomeScreenClient({super.key});

  @override
  State<HomeScreenClient> createState() => _HomeScreenClientState();
}

class _HomeScreenClientState extends State<HomeScreenClient> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    AddCategoryPage(),
    CategoriesListPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Screen",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 5,
      ),
      body: Center(
        child: Text(
          "You are client"
        ),
      )
    );
  }
}