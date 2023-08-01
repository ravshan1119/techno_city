import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:techno_city/data/model/category/category_model.dart';
import 'package:techno_city/providers/category_provider.dart';
import 'package:techno_city/ui/tab/home/widgets/update_category.dart';
import 'package:techno_city/utils/app_colors.dart';
import 'package:techno_city/utils/app_images.dart';

class CategoriesListPage extends StatefulWidget {
  const CategoriesListPage({super.key});

  @override
  State<CategoriesListPage> createState() => _CategoriesListPageState();
}

class _CategoriesListPageState extends State<CategoriesListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<CategoryModel>>(
        stream: context.read<CategoryProvider>().getCategories(),
        builder: (BuildContext context,
            AsyncSnapshot<List<CategoryModel>> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? ListView(
                    children: List.generate(
                      snapshot.data!.length,
                      (index) {
                        CategoryModel categoryModel = snapshot.data![index];
                        return ListTile(
                          onLongPress: () {
                            context.read<CategoryProvider>().deleteCategory(
                                context: context,
                                categoryId: categoryModel.categoryId);
                          },
                          title: Text(categoryModel.categoryName),
                          subtitle: Text(categoryModel.description),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    context
                                        .read<CategoryProvider>()
                                        .addDescriptionController
                                        .text = categoryModel.description;
                                    context
                                        .read<CategoryProvider>()
                                        .addNameController
                                        .text = categoryModel.categoryName;
                                    return UpdateCategoryPage(
                                      categoryId: categoryModel.categoryId,
                                      imageUrl: categoryModel.imageUrl,
                                    );
                                  },
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.edit,
                              color: AppColors.c_3669C9,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Center(child: Lottie.asset(AppImages.emptyState));
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
