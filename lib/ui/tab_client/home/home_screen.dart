import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techno_city/ui/tab_client/home/widgets/categories_list.dart';
import 'package:techno_city/ui/tab_client/home/widgets/product_container.dart';
import 'package:techno_city/ui/tab_client/home/widgets/search_text_field.dart';
import 'package:techno_city/ui/tab_client/home/widgets/text_see_all.dart';
import 'package:techno_city/utils/app_colors.dart';
import 'package:techno_city/utils/app_images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreenClient extends StatefulWidget {
  const HomeScreenClient({super.key});

  @override
  State<HomeScreenClient> createState() => _HomeScreenClientState();
}

class _HomeScreenClientState extends State<HomeScreenClient> {
  TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: AppColors.white),
        title: Text(
          "Mega Mall",
          style: TextStyle(
              fontFamily: "DMSans",
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.c_3669C9),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ZoomTapAnimation(
                onTap: (){},
                child: SvgPicture.asset(AppImages.orderNotif)),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: ZoomTapAnimation(
                onTap: (){},
                child: SvgPicture.asset(AppImages.shopping)),
          ),
          SizedBox(width: 15.w),
        ],
        elevation: 1,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 25.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: SearchTextField(
                  hintText: "Search Product Name",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  textAlign: TextAlign.start,
                  controller: searchTextController),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Container(
                height: 150.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.orangeAccent),
              ),
            ),
            SizedBox(height: 30.h),
            TextSeeAll(
              text: "Categories",
              seeAll: "See All",
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            const CategoriesList(),
            SizedBox(height: 22.h),
            TextSeeAll(
              text: "Featured Product",
              seeAll: "See All",
              onTap: () {},
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductContainer(),
                  ProductContainer(),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Container(
                height: 150.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.greenAccent),
              ),
            ),
            SizedBox(height: 20.h),
            TextSeeAll(
              text: "Best Sellers",
              seeAll: "See All",
              onTap: () {},
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductContainer(),
                  ProductContainer(),
                ],
              ),
            ),
            SizedBox(height: 36.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Container(
                height: 150.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.blue),
              ),
            ),
            SizedBox(height: 20.h),
            TextSeeAll(
              text: "New Arrivals",
              seeAll: "See All",
              onTap: () {},
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductContainer(),
                  ProductContainer(),
                ],
              ),
            ),
            SizedBox(height: 36.h),
            TextSeeAll(
              text: "Top Rated Product",
              seeAll: "See All",
              onTap: () {},
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductContainer(),
                  ProductContainer(),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            TextSeeAll(
              text: "Special Offers",
              seeAll: "See All",
              onTap: () {},
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductContainer(),
                  ProductContainer(),
                ],
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
