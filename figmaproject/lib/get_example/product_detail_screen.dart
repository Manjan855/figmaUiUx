import 'package:figmaproject/get_example/cart_page.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'products_controller.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    final product = controller.selectedProduct.value!;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Page')),
      body: Column(
        children: [
          Expanded(child: Center(child: Text(product.productName))),
          product.isFavourite.value
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),

          /// 🔢 Quantity Selector
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (product.quantity.value > 1) {
                      product.quantity.value--;
                    }
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  product.quantity.value.toString(),
                  style: const TextStyle(fontSize: 18),
                ),
                IconButton(
                  onPressed: () {
                    product.quantity.value++;
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          /// 🛒 Add to cart
          ElevatedButton(
            onPressed: () {
              controller.addToCart(product);
            },
            child: const Text('Add to cart'),
          ),

          ElevatedButton(
            onPressed: () {
              Get.to(const CartPage());
            },
            child: const Text('Go to cart page'),
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
