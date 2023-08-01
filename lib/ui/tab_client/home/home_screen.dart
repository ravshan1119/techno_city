import 'package:flutter/material.dart';
import 'package:techno_city/ui/tab_client/home/widgets/category_list_page.dart';
import 'package:techno_city/ui/tab_client/home/widgets/products_list_page.dart';
class HomeScreenClient extends StatefulWidget {
  const HomeScreenClient({super.key});

  @override
  State<HomeScreenClient> createState() => _HomeScreenClientState();
}

class _HomeScreenClientState extends State<HomeScreenClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Screen",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsListPageClient()));
          }, icon: Icon(Icons.more_horiz_outlined))
        ],
        elevation: 5,
      ),
      body: CategoriesListPage());
  }
}