import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EcommercePage extends StatefulWidget {
  const EcommercePage({super.key});

  @override
  State<EcommercePage> createState() => _EcommercePageState();
}

class _EcommercePageState extends State<EcommercePage> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<EcommerceModel> ecommercePages = [
    EcommerceModel(title: "Welcome to", title2: "", image: "assets/figma1.png"),
    EcommerceModel(
      title: "Buy Quality ",
      title2: "Dairy Products",
      image: "assets/markus.png",
    ),
    EcommerceModel(
      title: "Buy Quality ",
      title2: "Premium Products",
      image: "assets/markus3.png",
    ),
    EcommerceModel(
      title: "Get Discounts",
      title2: " On All products",
      image: "assets/markus2.png",
    ),
  ];

  @override
  void initState() {
    super.initState();

    /// Change status bar color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white12,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();

    /// Restore default status bar
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.asset("assets/actionBar.png", height: 32),
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: ecommercePages.length,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            itemBuilder: (context, index) {
              final page = ecommercePages[index];

              return Stack(
                children: [
                  /// Background image
                  Image.asset(
                    page.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 96, left: 47),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              page.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          /// Description
                          if (page.title2.isNotEmpty)
                            Text(
                              page.title2,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          if (index == 0)
                            Image.asset(
                              "assets/bigCart.png",
                              width: 127,
                              height: 50,
                            ),

                          const SizedBox(height: 20),

                          const Column(
                            children: [
                              Text("Lorem ipsum dolor sit amet, consetetur"),
                              Text("elitr, sed diam nonumy"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: DotsIndicator(
              dotsCount: ecommercePages.length,
              position: currentIndex.toDouble(),
              decorator: DotsDecorator(
                color: Colors.grey,
                activeColor: Colors.green,
                size: const Size(8, 8),
                activeSize: const Size(18, 8),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                if (currentIndex < ecommercePages.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  debugPrint("Go to Login / Home");
                }
              },
              child: Image.asset("assets/primaryButton.png", height: 50),
            ),
          ),
        ],
      ),
    );
  }
}

class EcommerceModel {
  final String title;

  final String title2;
  final String image;

  EcommerceModel({
    required this.title,

    required this.title2,
    required this.image,
  });
}
