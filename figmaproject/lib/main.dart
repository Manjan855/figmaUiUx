import 'package:figmaproject/ecommerce_page.dart';
//import 'package:figmaproject/Auth1_Welcome.dart';
// import 'package:figmaproject/Home_Page.dart';
import 'package:flutter/material.dart';
// import 'buying_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Auth1Welcome(),
      // home: HomePage(),
      home: EcommercePage(),
      //home: BuyingPage(),
      //title: 'Flutter Demo',
      //theme: ThemeData(),
    );
  }
}
