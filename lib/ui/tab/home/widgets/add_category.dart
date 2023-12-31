import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:techno_city/providers/category_provider.dart';
import 'package:techno_city/ui/auth/widgets/global_button.dart';
import 'package:techno_city/ui/auth/widgets/global_text_fields.dart';
import 'package:techno_city/ui/tab/home/add_category_widgets/categories_dialog_page.dart';
import 'package:techno_city/utils/app_colors.dart';
import 'package:techno_city/utils/constants.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  String imagePath = defaultImageConstant;
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Add Category",
              style: TextStyle(
                  fontFamily: "DMSans",
                  fontWeight: FontWeight.w700,
                  fontSize: 25.sp,
                  color: AppColors.c_3669C9),
            ),
            SizedBox(height: 20.h),
            GlobalTextField(
                hintText: "Name",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.start,
                controller: context.read<CategoryProvider>().addNameController),
            SizedBox(height: 20.h),
            GlobalTextField(
                hintText: "Description",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.start,
                controller:
                    context.read<CategoryProvider>().addDescriptionController),
            SizedBox(
              height: 20.h,
            ),
            ZoomTapAnimation(
              onTap: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => const Dialog(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CategoriesDialogPage(),
                    ),
                  ),
                );
              },
              child: Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: AppColors.c_3A9B7A),
                child: Center(
                    child: Text(
                  "Selected Category",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                    fontSize: 18.sp,
                    fontFamily: "LeagueSpartan",
                  ),
                )),
              ),
            ),
            SizedBox(height: 20.h),
            ZoomTapAnimation(
              onTap: (){
                showBottomSheetDialog();
              },
              child: Container(
                padding: EdgeInsets.all(14.sp),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.c_FDA429),
                child: Center(
                    child: context
                        .watch<CategoryProvider>()
                        .categoryUrl
                        .isEmpty
                        ? const Text(
                      "Image Not Selected",
                      style: TextStyle(color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                        : Image.network(
                        context.watch<CategoryProvider>().categoryUrl),),
              ),
            ),
            SizedBox(height: 20.h),
            GlobalButton(
                title: "Save Category",
                onTap: () {
                  if (imagePath != defaultImageConstant) {
                      context.read<CategoryProvider>().addCategory(
                        context: context,
                        imageUrl: imagePath,
                      );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(milliseconds: 500),
                        backgroundColor: Colors.red,
                        margin: EdgeInsets.symmetric(
                          vertical: 100,
                          horizontal: 20,
                        ),
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          "Select image!!!",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }

  void showBottomSheetDialog() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  _getFromCamera();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text("Select from Camera"),
              ),
              ListTile(
                onTap: () {
                  _getFromGallery();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.photo),
                title: const Text("Select from Gallery"),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _getFromCamera() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 512,
      maxWidth: 512,
    );

    if (xFile != null) {
      print("VBNKM<");
      await Provider.of<CategoryProvider>(context,listen: false)
          .uploadCategoryImage(context, xFile);

    }
  }

  Future<void> _getFromGallery() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (xFile != null) {
      await Provider.of<CategoryProvider>(context,listen: false)
          .uploadCategoryImage(context, xFile);
    }
  }
}
