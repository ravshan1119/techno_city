import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:techno_city/data/firebase/category_service.dart';
import 'package:techno_city/data/model/category/category_model.dart';
import 'package:techno_city/data/model/universal_data.dart';
import 'package:techno_city/utils/ui_utils/loading_dialog.dart';

class CategoryProvider with ChangeNotifier {
  final CategoryService categoryService;

  bool isLoading = false;

  CategoryProvider({required this.categoryService});

  TextEditingController addNameController = TextEditingController();
  TextEditingController addDescriptionController = TextEditingController();
  String categoryType="";

  Future<void> addCategory({
    required BuildContext context,
    required String imageUrl,
  }) async {

    if (addNameController.text.isNotEmpty && addDescriptionController.text.isNotEmpty) {
      CategoryModel categoryModel = CategoryModel(
        categoryId: "",
        categoryName: addNameController.text,
        description: addDescriptionController.text,
        imageUrl: imageUrl,
        createdAt: DateTime.now().toString(),
      );
      showLoading(context: context);
      UniversalData universalData =
      await categoryService.addCategory(categoryModel: categoryModel);
      if (context.mounted) {
        hideLoading(dialogContext: context);
      }
      if (universalData.error.isEmpty) {
        if (context.mounted) {
          showMessage(context, universalData.data as String);
          clearTexts();
        }
      } else {
        if (context.mounted) {
          showMessage(context, universalData.error);
        }
      }
    } else {
      showMessage(context, "Maydonlar to'liq emas!!!");
    }





  }

  Future<void> updateCategory({
    required BuildContext context,
    required CategoryModel categoryModel,
  }) async {
    showLoading(context: context);
    UniversalData universalData =
        await categoryService.updateCategory(categoryModel: categoryModel);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showMessage(context, universalData.data as String);
      }
    } else {
      if (context.mounted) {
        showMessage(context, universalData.error);
      }
    }
  }

  Future<void> deleteCategory({
    required BuildContext context,
    required String categoryId,
  }) async {
    showLoading(context: context);
    UniversalData universalData =
        await categoryService.deleteCategory(categoryId: categoryId);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showMessage(context, universalData.data as String);
      }
    } else {
      if (context.mounted) {
        showMessage(context, universalData.error);
      }
    }
  }

  showMessage(BuildContext context, String error) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(error.toString())));

    isLoading = false;
    notifyListeners();
  }

  Stream<List<CategoryModel>> getCategories() =>
      FirebaseFirestore.instance.collection("categories").snapshots().map(
            (event1) => event1.docs
                .map((doc) => CategoryModel.fromJson(doc.data()))
                .toList(),
          );


  clearTexts() {
    addNameController.clear();
    addDescriptionController.clear();
  }
}