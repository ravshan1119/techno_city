import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:techno_city/data/model/product/product_model.dart';
import 'package:techno_city/providers/category_provider.dart';
import 'package:techno_city/ui/tab_client/home/widgets/product_container.dart';
import 'package:techno_city/ui/tab_client/home/widgets/search_text_field.dart';
import 'package:techno_city/ui/tab_client/home/widgets/text_see_all.dart';
import 'package:techno_city/utils/app_colors.dart';
import 'package:techno_city/utils/app_images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/model/category/category_model.dart';
import '../../../providers/products_provider.dart';

class HomeScreenClient extends StatefulWidget {
  const HomeScreenClient({super.key});

  @override
  State<HomeScreenClient> createState() => _HomeScreenClientState();
}

class _HomeScreenClientState extends State<HomeScreenClient> {
  TextEditingController searchTextController = TextEditingController();
  String categoryId = "";

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
                onTap: () {}, child: SvgPicture.asset(AppImages.orderNotif)),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ZoomTapAnimation(
                onTap: () {}, child: SvgPicture.asset(AppImages.shopping)),
          ),
          SizedBox(width: 15.w),
        ],
        elevation: 1,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
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
              StreamBuilder<List<CategoryModel>>(
                  stream: context.read<CategoryProvider>().getCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: 60.h,
                        child: Expanded(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ZoomTapAnimation(
                                onTap:(){
                                  categoryId="";
                                  setState(() {

                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 6.w,vertical: 9.h),
                                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      color:categoryId==""?Colors.tealAccent:Colors.amber),
                                  child: const Center(child: Text("All")),
                                ),
                              ),
                              ...List.generate(
                                snapshot.data!.length,
                                    (index) => ZoomTapAnimation(
                                  onTap: (){
                                    categoryId=snapshot.data![index].categoryId;
                                    setState(() {

                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 6.w,vertical: 9.h),
                                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16.r),
                                        color:categoryId==snapshot.data![index].categoryId?Colors.tealAccent: Colors.amber),
                                    child: Center(child: Text(snapshot.data![index].categoryName)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  }
              ),
              SizedBox(height: 22.h),
              TextSeeAll(
                text: "Featured Product",
                seeAll: "See All",
                onTap: () {},
              ),
              SizedBox(height: 24.h),
            ],
          ),
          StreamBuilder(
            stream:
            context.read<ProductsProvider>().getProducts(categoryId),
            builder: (context, snapshot) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  ProductModel productModel = snapshot.data![index];
                  return ProductContainer(
                      title: productModel.productName,
                      currency: productModel.currency,
                      price: productModel.price.toString());
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
