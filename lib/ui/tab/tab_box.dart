import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techno_city/providers/auth_provider.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("tabBox"),
          ),
          TextButton(
              onPressed: () {
                context.read<AuthProvider>().logOut(context);
              },
              child: const Text("log out"))
        ],
      ),
    );
  }
}
