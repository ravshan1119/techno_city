import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techno_city/providers/profile_provider.dart';

import '../../providers/auth_provider.dart';
import '../../utils/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = context.read<ProfileProvider>().currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profil Screen",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: AppColors.c_FAFAFA,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    user?.email ?? "",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.c_13181F),
                  ),
                  Text(
                    user?.displayName ?? "",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.c_13181F),
                  ),
                  Center(
                    child: Text(
                      "tabBox",
                      style: TextStyle(color: AppColors.c_3669C9),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        context.read<AuthProvider>().logOutUser(context);
                      },
                      child: const Text("log out"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
