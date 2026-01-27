import 'package:flutter/material.dart';

class ShippingCart extends StatefulWidget {
  const ShippingCart({super.key});

  @override
  State<ShippingCart> createState() => _ShippingCartState();
}

class _ShippingCartState extends State<ShippingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("Shopping Cart", style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: 150),
                Image.asset("assets/success.png", width: 200, height: 200),
                SizedBox(height: 15),
                Text(
                  "Your Cart is Empty!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              "You will get a response within.",
              style: TextStyle(fontSize: 16),
            ),
            Text(" a few minutes.", style: TextStyle(fontSize: 16)),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 17, right: 17),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.green, // Background color
                ),
                onPressed: () {},
                child: Text("Start shopping", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
