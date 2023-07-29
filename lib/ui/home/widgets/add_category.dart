import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:techno_city/data/model/category/category_model.dart';
import 'package:techno_city/providers/category_provider.dart';
import 'package:techno_city/ui/auth/widgets/global_button.dart';
import 'package:techno_city/ui/auth/widgets/global_text_fields.dart';
import 'package:techno_city/utils/app_colors.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: Text(
                "Add Category",
                style: TextStyle(
                    fontFamily: "DMSans",
                    fontWeight: FontWeight.w700,
                    fontSize: 25.sp,
                    color: AppColors.c_3669C9),
              ),
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
            SizedBox(height: 20.h),
            GlobalButton(
                title: "Save Category",
                onTap: () {
                  if (context
                              .read<CategoryProvider>()
                              .addDescriptionController
                              .text ==
                          "" ||
                      context
                              .read<CategoryProvider>()
                              .addDescriptionController
                              .text ==
                          "") {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Empty")));
                  } else {
                    context.read<CategoryProvider>().addCategory(
                          context: context,
                          categoryModel: CategoryModel(
                            categoryId: "",
                            categoryName: context
                                .read<CategoryProvider>()
                                .addNameController
                                .text,
                            description: context
                                .read<CategoryProvider>()
                                .addDescriptionController
                                .text,
                            imageUrl: "",
                            createdAt: DateTime.now().toString(),
                          ),
                        );
                    context.read<CategoryProvider>().addNameController.clear();
                    context
                        .read<CategoryProvider>()
                        .addDescriptionController
                        .clear();
                  }
                })
          ],
        ),
      ),
    );
  }
}
