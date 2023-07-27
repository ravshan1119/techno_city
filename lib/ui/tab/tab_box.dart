import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:techno_city/providers/auth_provider.dart';
import 'package:techno_city/utils/colors/app_colors.dart';
import 'package:techno_city/utils/images/app_images.dart';

class TabBox extends StatefulWidget {
  @override
  _TabBoxState createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: <Widget>[
            SvgPicture.asset(AppImages.home,height: 30.h,width: 30.h,),
            SvgPicture.asset(AppImages.wishlist,height: 30.h,width: 30.h,),
            SvgPicture.asset(AppImages.order,height: 30.h,width: 30.h,),
            SvgPicture.asset(AppImages.login,height: 30.h,width: 30.h,),
            SvgPicture.asset(AppImages.login,height: 30.h,width: 30.h,),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: AppColors.c_0C1A30,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
          color: AppColors.c_0C1A30,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text("tabBox",style: TextStyle(
                        color: Colors.white
                      ),),
                    ),
                    TextButton(
                        onPressed: () {
                          context.read<AuthProvider>().LogOutUser(context);
                        },
                        child: const Text("log out"))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}


