import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  final List<ProductModel> products = [
    ProductModel(
      image: "assets/peach.png",
      name: "Fresh Peach",
      unit: "dozen",
      price: 8.00,
    ),
    ProductModel(
      image: "assets/avocado.png",
      name: "Avocado",
      unit: "2.0 lbs",
      price: 7.00,
      isNew: true,
      hasQuantity: true,
    ),
    ProductModel(
      image: "assets/pineapple.png",
      name: "Pineapple",
      unit: "1.5 lbs",
      price: 9.90,
    ),
    ProductModel(
      image: "assets/grapes.png",
      name: "Black Grapes",
      unit: "5.0 lbs",
      price: 7.05,
      isNew: true,
    ),
    ProductModel(
      image: "assets/pomegranate.png",
      name: "Pomegranate",
      unit: "1.5 lbs",
      price: 2.09,
      isNew: true,
      hasQuantity: true,
    ),
    ProductModel(
      image: "assets/broccoli.png",
      name: "Fresh Broccoli",
      unit: "1 kg",
      price: 3.00,
    ),
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
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        "assets/search.svg",
                        height: 20,
                        width: 20,
                      ),
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
                height: h * 0.25,
                autoPlay: true,
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
                      _categoryController.animateTo(
                        _categoryController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 110,
              child: ListView.builder(
                controller: _categoryController,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categoryImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 12),
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 6),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(categoryImages[index], height: 40),
                    ),
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
                  Icon(Icons.arrow_forward_ios, size: 18),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final p = products[index];

                  return Container(
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
                        Stack(
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
                            const Align(
                              alignment: Alignment.topRight,
                              child: Icon(Icons.favorite_border, size: 16),
                            ),
                          ],
                        ),

                        CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.orange.shade50,
                          child: Image.asset(p.image, height: 45),
                        ),

                        Text(
                          "\$${p.price.toStringAsFixed(2)}",
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          p.name,
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

                        p.hasQuantity
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.remove,
                                    size: 18,
                                    color: Colors.green,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.add,
                                    size: 18,
                                    color: Colors.green,
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Colors.green,
                                    size: 16,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "Add to cart",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  );
                },
              ),
            ),

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
                  SvgPicture.asset("assets/home.svg"),
                  SvgPicture.asset("assets/heart.svg"),
                  SvgPicture.asset("assets/shoppingcart.svg"),
                  SvgPicture.asset("assets/user.png"),
                ],
              ),
            ),
            Positioned(
              top: -20,
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.green,
                child: Icon(Icons.shopping_bag, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductModel {
  final String image;
  final String name;
  final String unit;
  final double price;
  final bool isNew;
  final bool hasQuantity;
  final bool isTag;

  ProductModel({
    required this.image,
    required this.name,
    required this.unit,
    required this.price,
    this.isNew = false,
    this.hasQuantity = false,
    this.isTag = false,
  });
}
