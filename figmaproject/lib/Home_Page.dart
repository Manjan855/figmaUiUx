import 'package:figmaproject/product_controller.dart';
import 'package:figmaproject/product_detail.dart';
//import 'package:figmaproject/product_detail.dart';
import 'package:figmaproject/product_list.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductController controller = Get.put(ProductController());
  final ScrollController _categoryController = ScrollController();

  final List<String> bannerImages = [
    "assets/unsplash.png",
    "assets/unsplash.png",
    "assets/unsplash.png",
  ];

  final List<String> categoryImages = [
    "assets/c1.png",
    "assets/c2.png",
    "assets/c3.png",
    "assets/c4.png",
    "assets/c5.png",
    "assets/c6.png",
  ];
  final List<categoryModels> categoryNames = [
    categoryModels(image: "assets/c1.png", name: "Vegetables"),
    categoryModels(image: "assets/c2.png", name: "Fruits"),
    categoryModels(image: "assets/c3.png", name: "Beverages"),
    categoryModels(image: "assets/c4.png", name: "Grocery"),
    categoryModels(image: "assets/c5.png", name: "Edible Oil"),
    categoryModels(image: "assets/c6.png", name: "Household"),
  ];

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search keywords...",
                    prefixIcon: SvgPicture.asset(
                      "assets/search.svg",
                      height: 20,
                      width: 20,
                    ),
                    suffixIcon: SvgPicture.asset(
                      "assets/bar.svg",
                      height: 20,
                      width: 20,
                    ),
                    filled: true,
                    fillColor: const Color(0xffF4F5F9),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),

            CarouselSlider(
              options: CarouselOptions(
                height: h * 0.35,
                autoPlay: false,
                viewportFraction: 1,
              ),
              items: bannerImages.map((e) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    e,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              }).toList(),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 18),
                    onPressed: () {
                      if (!_categoryController.hasClients) return;

                      final double maxScroll =
                          _categoryController.position.maxScrollExtent;
                      final double currentScroll = _categoryController.offset;

                      const double scrollAmount = 120;
                      if (currentScroll >= maxScroll) {
                        _categoryController.animateTo(
                          0,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        _categoryController.animateTo(
                          currentScroll + scrollAmount,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 130,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final bool isWebWide = constraints.maxWidth > 600;

                  return ListView.builder(
                    controller: _categoryController,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: categoryNames.length,
                    itemBuilder: (context, index) {
                      final category = categoryNames[index];

                      return Container(
                        margin: const EdgeInsets.only(right: 12),
                        width: isWebWide ? 140 : 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 6),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(category.image, height: 40),
                            const SizedBox(height: 8),
                            Text(
                              category.name,
                              style: const TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Featured products",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.arrow_forward_ios_sharp, size: 18),
                ],
              ),
            ),

            Obx(() {
              print("Featured count: ${controller.featuredProductList.length}");
              if (controller.featuredProductList.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(child: Text("No featured products")),
                );
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.featuredProductList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final ProductModel p = controller.featuredProductList[index];

                  return GestureDetector(
                    onTap: () {
                      controller.selectedProduct.value = p;
                      Get.to(() => ProductDetail(product: p));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 5),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (p.isNew)
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text(
                                  "NEW",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                          CircleAvatar(
                            radius: 32,
                            backgroundColor: Colors.orange.shade50,
                            child: Image.asset(p.productImage, height: 45),
                          ),

                          Text(
                            "\$${p.price.toStringAsFixed(2)}",
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            p.productName,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          Text(
                            p.unit,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              controller.addToCart(p, 1);
                              Get.to(() => ProductListScreen());
                            },
                            child: const Text(
                              "Add to cart",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),

            const SizedBox(height: 60),
          ],
        ),
      ),

      bottomNavigationBar: SizedBox(
        height: 80,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.white,

                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(
                    "assets/home.svg",
                    color: Colors.black,
                    height: 12,
                  ),
                  SvgPicture.asset(
                    "assets/heart.svg",
                    color: Colors.black,
                    height: 12,
                  ),
                  SvgPicture.asset(
                    "assets/bag.svg",
                    color: Colors.black,
                    height: 12,
                  ),
                  SvgPicture.asset("assets/user.svg", height: 24),
                ],
              ),
            ),
            // Positioned(
            //   top: -20,
            //   child: CircleAvatar(
            //     radius: 40,
            //     backgroundColor: Colors.green,
            //     child: Icon(Icons.shopping_bag, color: Colors.white),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class categoryModels {
  final String image;
  final String name;

  categoryModels({required this.image, required this.name});
}
