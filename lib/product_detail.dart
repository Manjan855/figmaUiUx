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
  final TextEditingController _quantityController = TextEditingController(
    text: '1',
  );
  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: double.infinity,
                  color: Color(0xFFF2FFE6),
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Image.asset(
                    widget.product.productImage,
                    fit: BoxFit.contain,
                  ),
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
                        "\$${widget.product.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SvgPicture.asset("assets/heart.svg", height: 24),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.product.productName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  SizedBox(height: 10),
                  Text(
                    widget.product.unit,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),

                      Row(
                        children: [
                          Text(
                            widget.product.rating.toString(),
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 4),
                          Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                index < widget.product.rating.round()
                                    ? Icons.star
                                    : Icons.star_border,
                                color: Colors.amber,
                                size: 16,
                              );
                            }),
                          ),
                        ],
                      ),

                      const SizedBox(width: 4),

                      const Text(
                        "(89 views)",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  Text(
                    widget.product.description,
                    style: const TextStyle(fontSize: 14),
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
                            color: Color(0xFF868889),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
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
                                child: const Icon(
                                  Icons.remove,
                                  size: 18,
                                  color: Colors.green,
                                ),
                              ),
                            ),

                            // const SizedBox(width: 8),

                            // Quantity input
                            SizedBox(
                              width: 30,
                              height: 30,
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

                            // const SizedBox(width: 8),

                            // Increment
                            GestureDetector(
                              onTap: () {
                                int value =
                                    int.tryParse(_quantityController.text) ?? 1;
                                _quantityController.text = (value + 1)
                                    .toString();
                                setState(() {});
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 18,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 36,
                      left: 17,
                      right: 17,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: Size(double.infinity, 60),
                        backgroundColor: Color(0xFF6CC51D),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        final controller = Get.find<ProductController>();
                        final int quantity =
                            int.tryParse(_quantityController.text) ?? 1;

                        controller.addToCart(widget.product, quantity);
                        Get.to(() => const ProductListScreen());
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: const Text(
                                "Add to cart",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                          SvgPicture.asset(
                            "assets/bag.svg",
                            height: 22,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 50,
                  //   width: double.infinity,
                  //   child: InkWell(
                  //     borderRadius: BorderRadius.circular(10),
                  //     onTap: () {
                  //       final controller = Get.find<ProductController>();
                  //       final int quantity =
                  //           int.tryParse(_quantityController.text) ?? 1;

                  //       controller.addToCart(widget.product, quantity);
                  //       Get.to(() => const ProductListScreen());
                  //     },
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         color: Colors.green,
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //       child: Stack(
                  //         alignment: Alignment.center,
                  //         children: [
                  //           const Text(
                  //             "Add to cart",
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.w600,
                  //             ),
                  //           ),
                  //           Positioned(
                  //             right: 14,
                  //             child: SvgPicture.asset(
                  //               "assets/bag.svg",
                  //               height: 22,
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
