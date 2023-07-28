import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:techno_city/providers/profile_provider.dart';
import 'package:techno_city/ui/auth/widgets/global_text_fields.dart';
import 'package:techno_city/utils/app_images.dart';

import '../../providers/auth_provider.dart';
import '../../utils/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      body: Stack(
        children: [
          Container(
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GlobalTextField(
                            hintText: "display name",
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            textAlign: TextAlign.start,
                            controller: context
                                .read<ProfileProvider>()
                                .displayNameController),
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              context
                                  .read<ProfileProvider>()
                                  .updateUserDisplayName(context);
                              context
                                  .read<ProfileProvider>()
                                  .displayNameController
                                  .clear();
                            });
                          },
                          child: Text("update display name")),
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
          Visibility(
            visible: context.watch<ProfileProvider>().isLoading,
            child: Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  height: 200.h,
                  width: 200.h,
                  child: SizedBox(
                      height: 100.h,
                      width: 100.h,
                      child:
                          Center(child: Lottie.asset(AppImages.checkLoader))),
                )),
          ),
        ],
      ),
    );
  }
}
