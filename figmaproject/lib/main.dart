//import 'package:figmaproject/ecommerce_page.dart';
// import 'package:figmaproject/Auth1_Welcome.dart';
//import 'package:figmaproject/Home_Page.dart';
// import 'package:figmaproject/get_example/product_detail_screen.dart';
//import 'package:figmaproject/get_example/products_controller.dart';
import 'package:figmaproject/product_controller.dart';
//import 'package:figmaproject/get_example/cart_page.dart';
//import 'package:figmaproject/get_example/product_list.dart';
import 'package:figmaproject/product_detail.dart';
import 'package:figmaproject/product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'buying_page.dart';
//import 'package:figmaproject/product_list.dart';

void main() {
  Get.put(ProductController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Auth1Welcome(),
      //home: HomePage(),
      //home: EcommercePage(),
      //home: BuyingPage(),
      //title: 'Flutter Demo',
      //theme: ThemeData(),
      // home: ProductDetailScreen(),
      // home: ProductListScreen(),
      //home:ProductListScreen(),
      // home: const ProductListScreen(),
      home: ProductDetail(
        product: ProductModel(
          productImage: "assets/lime.png",
          productName: "Organic Lemon",
          unit: "1.5 lbs",
          price: 2.22,
          isFavourite: false.obs,
          quantity: 1.obs,
          isNew: true,
        ),
      ),
    );
  }
}
