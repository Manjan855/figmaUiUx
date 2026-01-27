import 'package:figmaproject/get_example/products_controller.dart';
import 'package:figmaproject/get_example/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    // final controller = Get.find<ProductController>();
    return Scaffold(
      appBar: AppBar(title: Text('Product List Screen')),
      body: GridView.builder(
        itemCount: Get.find<ProductController>().featuredProductList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: 2,
        ),
        itemBuilder: (_, i) {
          return Obx(() {
            final item = Get.find<ProductController>().featuredProductList[i];
            return GestureDetector(
              onTap: () {
                Get.find<ProductController>().selectedProduct.value = item;
                Get.to(ProductDetailScreen());
              },
              child: Container(
                height: 100,
                color: Colors.teal,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        item.isFavourite.value = !item.isFavourite.value;
                      },
                      child: item.isFavourite.value
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border),
                    ),
                    Text(item.productName),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
