import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techno_city/ui/auth/signup.screen.dart';
import 'package:techno_city/ui/auth/widgets/global_button.dart';
import 'package:techno_city/ui/auth/widgets/global_text_fields.dart';
import 'package:techno_city/utils/colors/app_colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.grey),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 127.h,
              ),
              Text(
                """Welcome back to\nTechno City""",
                style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: "DMSans",
                    color: AppColors.c_0C1A30),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Please enter data to login",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: "DMSans",
                    color: AppColors.c_838589),
              ),
              SizedBox(
                height: 50.h,
              ),
              Text(
                "Email/ Phone",
                style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: "DMSans",
                    color: AppColors.c_0C1A30),
              ),
              SizedBox(
                height: 20.h,
              ),
              GlobalTextField(
                  hintText: "email / phone",
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.start,
                  onChanged: (v) {}),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Password",
                style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: "DMSans",
                    color: AppColors.c_0C1A30),
              ),
              SizedBox(
                height: 20.h,
              ),
              GlobalTextField(
                  hintText: "password",
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.start,
                  onChanged: (v) {}),
              SizedBox(
                height: 70.h,
              ),
              GlobalButton(title: "Sign in", onTap: () {}),
              SizedBox(
                height: 104.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontFamily: "DMSans",
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: AppColors.c_0C1A30,
                    ),
                  ),
                  ZoomTapAnimation(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: "DMSans",
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.c_3669C9,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
