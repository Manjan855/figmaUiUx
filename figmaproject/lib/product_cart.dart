import 'package:figmaproject/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCart extends StatefulWidget {
  const ProductCart({super.key});

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  @override
  Widget build(BuildContext context) {
    Get.put<ProductController>;
    return Scaffold();
  }
}