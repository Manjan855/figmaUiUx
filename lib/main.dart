import 'package:figmaproject/ecommerce_page.dart';
//import 'package:figmaproject/order_success.dart';
//import 'package:figmaproject/payment_method.dart';
// import 'package:figmaproject/Auth1_Welcome.dart';
//import 'package:figmaproject/Home_Page.dart';
// import 'package:figmaproject/MyFavourites_Page.dart';
// import 'package:figmaproject/get_example/product_detail_screen.dart';
//import 'package:figmaproject/get_example/products_controller.dart';
//import 'package:figmaproject/Categories_Page.dart';
// import 'package:figmaproject/Account_Page.dart';
//import 'package:figmaproject/Accountfolder/About_Me.dart';
//import 'package:figmaproject/Accountfolder/Credit_Cards.dart';
//import 'package:figmaproject/Accountfolder/Add_Card.dart';
//import 'package:figmaproject/Accountfolder/Notifications.dart';
//import 'package:figmaproject/Accountfolder/Transactions.dart';

//import 'package:figmaproject/Accountfolder/Add_Address.dart';
//import 'package:figmaproject/Accountfolder/My_Adress.dart';
//import 'package:figmaproject/Apply_Filters.dart';
//import 'package:figmaproject/Dummy_folder/Combined_page.dart';
//import 'package:figmaproject/Forgot_Password.dart';
//import 'package:figmaproject/Review.dart';
//import 'package:figmaproject/Shipping_Method.dart';
//import 'package:figmaproject/Track_oder.dart';
//import 'package:figmaproject/Write_Review.dart';
//import 'package:figmaproject/Verify_Number.dart';
//import 'package:figmaproject/Accountfolder/My_Orders.dart';
//import 'package:figmaproject/CategoriesFolder/Vegetables_Page.dart';

import 'package:figmaproject/product_controller.dart';
//import 'package:figmaproject/get_example/cart_page.dart';
//import 'package:figmaproject/get_example/product_list.dart';
//import 'package:figmaproject/product_detail.dart';
//import 'package:figmaproject/product_list.dart';
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
      // home: HomePage(),
      // home: MyfavouritesPage(),
      home: EcommercePage(),
      //home: BuyingPage(),
      // home: PaymentMethod(),
      // home: VegetablesPage(),
      // home: AboutMe(),
      //home: Notifications(),
      //home: AddCard(),
      //home: Transactions(),
      //home: CreditCards(),
      // home: MyAdress(),
      // home: ApplyFiltersPage(),
      // home: MyOrders(),
      //home: AddAddress(),
      // home: Review(),
      // home: WriteReview(),
      // home: TrackOrderPage(),
      //home: ShippingMethod(),
      //home: VerifyNumber(),
      //home: ForgotPassword(),
      // home: AccountPage(),
      //home: CategoriesPage(),
      // home: OrderSuccess(),
      //title: 'Flutter Demo',
      //theme: ThemeData(),
      // home: ProductDetailScreen(),
      // home: ProductListScreen(),
      //home:ProductListScreen(),
      // home: const ProductListScreen(),
      // home: ProductDetail(
      //   product: ProductModel(
      //     productImage: "assets/lime.png",
      //     productName: "Organic Lemon",
      //     unit: "1.5 lbs",
      //     price: 2.22,
      //     isFavourite: false.obs,
      //     quantity: 1.obs,
      //     isNew: true,
      //   ),
      // ),
    );
  }
}
