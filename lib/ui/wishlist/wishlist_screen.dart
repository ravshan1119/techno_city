import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wishlist Screen",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 5,
      ),
    );
  }
}
