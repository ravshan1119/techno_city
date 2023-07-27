import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:techno_city/providers/auth_provider.dart';
import 'package:techno_city/ui/auth/login_screen.dart';
import 'package:techno_city/ui/auth/widgets/global_button.dart';
import 'package:techno_city/ui/auth/widgets/global_text_fields.dart';
import 'package:techno_city/utils/colors/app_colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.grey),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 127.h,
                  ),
                  Text(
                    """Register Account""",
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
                    "Enter Email/No. Phone to register ",
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
                      controller: context.read<AuthProvider>().emailController),
                  SizedBox(height: 20.h,),
                  GlobalTextField(
                      hintText: "password",
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      textAlign: TextAlign.start,
                      controller: context.read<AuthProvider>().passwordController),
                  SizedBox(
                    height: 180.h,
                  ),
                  GlobalButton(title: "Sign Up", onTap: () {
                    context.read<AuthProvider>().SignUpUser(context);
                  }),
                  SizedBox(
                    height: 104.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an Account?",
                        style: TextStyle(
                          fontFamily: "DMSans",
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: AppColors.c_0C1A30,
                        ),
                      ),
                      ZoomTapAnimation(
                        onTap: () {
                          context.read<AuthProvider>().signupButtonPressed();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            fontFamily: "DMSans",
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: AppColors.c_3669C9,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: context.watch<AuthProvider>().isLoading,
            child: const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}
