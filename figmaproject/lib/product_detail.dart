// import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';

//import 'package:figmaproject/Home_Page.dart';
import 'package:figmaproject/product_controller.dart';
import 'package:figmaproject/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProductDetail extends StatefulWidget {
  final ProductModel product;
  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int quantity = 1;
  TextEditingController _quantityController = TextEditingController(text: '1');
  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: double.infinity,
                color: Color(0xFFF2FFE6),
                height: MediaQuery.of(context).size.height * 0.45,
                child: Image.asset('assets/lime.png', fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$2.22",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SvgPicture.asset("assets/heart.svg", height: 24),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Organics Lemeon",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "1.50 lbs",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "4.5",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),

                    Row(
                      children: List.generate(5, (index) {
                        if (index < 4) {
                          return const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          );
                        } else if (index == 4) {
                          return const Icon(
                            Icons.star_half,
                            color: Colors.amber,
                            size: 16,
                          );
                        } else {
                          return const Icon(
                            Icons.star_border,
                            color: Colors.amber,
                            size: 16,
                          );
                        }
                      }),
                    ),

                    const SizedBox(width: 6),

                    const SizedBox(width: 4),

                    const Text(
                      "(89 views)",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),

                Text(
                  "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                  ),
                ),
                const Text(
                  "More",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Label
                      const Text(
                        "Quantity",
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),

                      // Quantity controls
                      Row(
                        children: [
                          // Decrement
                          GestureDetector(
                            onTap: () {
                              int value =
                                  int.tryParse(_quantityController.text) ?? 1;
                              if (value > 1) {
                                _quantityController.text = (value - 1)
                                    .toString();
                              }
                              setState(() {});
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Icon(Icons.remove, size: 18),
                            ),
                          ),

                          const SizedBox(width: 8),

                          // Quantity input
                          SizedBox(
                            width: 40,
                            child: TextField(
                              controller: _quantityController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 8),

                          // Increment
                          GestureDetector(
                            onTap: () {
                              int value =
                                  int.tryParse(_quantityController.text) ?? 1;
                              _quantityController.text = (value + 1).toString();
                              setState(() {});
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Icon(Icons.add, size: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset("assets/rectangle.png", fit: BoxFit.cover),
                        GestureDetector(
                          onTap: () {
                            final controller = Get.find<ProductController>();

                            // Parse quantity from text field safely
                            final int quantity =
                                int.tryParse(_quantityController.text) ?? 1;

                            // Add to cart
                            controller.addToCart(widget.product, quantity);

                            // Navigate to cart screen
                            Get.to(() => const ProductListScreen());
                          },
                          child: const Text(
                            "Add to cart",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),

                        SizedBox(width: 80),
                        SvgPicture.asset(
                          alignment: Alignment.centerRight,
                          "assets/bag.svg",

                          height: 24,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
