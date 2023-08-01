import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techno_city/data/model/product/product_model.dart';
import 'package:techno_city/providers/products_provider.dart';

class ProductsListPage extends StatefulWidget {
  const ProductsListPage({super.key});

  @override
  State<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<ProductModel>>(
        stream: context.read<ProductsProvider>().getProducts(""),
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? ListView(
              children: List.generate(
                snapshot.data!.length,
                    (index) {
                  ProductModel productModel = snapshot.data![index];
                  return ListTile(
                    leading: Image.file(File(productModel.productImages[0])),
                    onLongPress: () {
                      context.read<ProductsProvider>().deleteProduct(
                        context: context,
                        productId: productModel.productId,
                      );
                    },
                    title: Text(productModel.productName),
                    subtitle: Text(productModel.description),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                  );
                },
              ),
            )
                : const Center(child: Text("Product Empty!"));
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