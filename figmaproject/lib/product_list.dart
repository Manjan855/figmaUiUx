import 'package:figmaproject/product_controller.dart';
//import 'package:figmaproject/product_detail.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<ProductModel> products = List.from(productList);
  int? counter;
  // int quantity = 1;
  // int itemCount = 1;

  // final ProductController prdController = Get.put(ProductController());

  @override
  @override
  void initState() {
    super.initState();
    readValue();
  }

  Future<void> readValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    counter = prefs.getInt('counter');
    setState(() {});
  }

  void deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(counter == null ? "" : 'Value: $counter'),
        actions: [
          IconButton(
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setInt('counter', 10);
              print('Value saved');
              readValue();
            },
            icon: const Icon(Icons.read_more),
          ),
          IconButton(
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              final int? counter = prefs.getInt('counter');
              print(counter ?? 'No value found');
            },
            icon: const Icon(Icons.print),
          ),
          IconButton(
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              prefs.remove('counter');
              print('Value removed');
              readValue();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.cartList.isEmpty) {
          return const Center(
            child: Text("Your cart is empty", style: TextStyle(fontSize: 18)),
          );
        }

        return Column(
          children: [
            // 🛒 CART ITEMS
            Expanded(
              child: ListView.builder(
                itemCount: controller.cartList.length,
                itemBuilder: (_, i) {
                  final product = controller.cartList[i];

                  return Slidable(
                    key: ValueKey(product.productName),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (_) {
                            controller.deleteFromCart(product);
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Remove',
                        ),
                      ],
                    ),
                    child: CartItemTile(product: product),
                  );
                },
              ),
            ),

            // 💰 TOTAL + CHECKOUT
            CartSummary(),
          ],
        );
      }),
    );
  }
}

// class DrawerMotion {
//   const DrawerMotion();
// }

class CartItemTile extends StatelessWidget {
  final ProductModel product;
  CartItemTile({super.key, required this.product});

  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        product.productImage,
        width: 55,
        height: 55,
        fit: BoxFit.cover,
      ),

      title: Text(
        'Rs \$${product.price}',
        style: const TextStyle(
          color: Color(0xFF6CC51D),
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
      subtitle: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '${product.productName}\n',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            TextSpan(
              text: product.unit,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ],
        ),
      ),
      trailing: SizedBox(
        // width: 40,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => controller.increase(product),
              child: Container(
                height: 22,
                width: 22,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(Icons.add, size: 14, color: Colors.white),
              ),
            ),

            // const SizedBox(height: 4),
            Obx(
              () => Text(
                product.quantity.value.toString(),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 4),

            InkWell(
              onTap: () => controller.decrease(product),
              child: Container(
                height: 22,
                width: 22,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(Icons.remove, size: 14, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartSummary extends StatelessWidget {
  CartSummary({super.key});

  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final total = controller.calculateTotalPrice();

      return Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "\$${total.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  Get.snackbar(
                    "Checkout",
                    "Total: \$${total.toStringAsFixed(2)}",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: const Text(
                  "Checkout",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class ProductModel {
  final String productName;
  final String productImage;
  final double price;
  final String unit;
  RxInt quantity = 1.obs;
  RxBool isFavourite;
  final bool isNew;
  //final String description;
  //final double rating;

  ProductModel({
    required this.productName,
    required this.productImage,
    required this.price,
    required this.unit,
    required this.quantity,
    required this.isFavourite,
    this.isNew = false,
    //required this.description,
    // required this.rating,
  });
}

// Sample product list
final List<ProductModel> productList = [
  ProductModel(
    productName: "Fresh brocoli",
    productImage: "assets/broccoli.png",
    price: 2.22 * 4,
    unit: "1.50 lbs",
    isFavourite: false.obs,
    isNew: false,
    quantity: 1.obs,
    //description: "",
    // rating: 4.5,
  ),
  ProductModel(
    productName: "Black Grapes",
    productImage: "assets/grapes.png",
    price: 2.22 * 4,
    unit: "5.0 lbs",
    isFavourite: false.obs,
    quantity: 1.obs,
    //description: "",
    //rating: 4.2,
  ),
  ProductModel(
    productName: "Avacado",
    productImage: "assets/avocado.png",
    price: 2.22 * 4,
    unit: "1.50lbs",
    isFavourite: false.obs,
    quantity: 1.obs,
    //description: "",
    //rating: 4.7,
  ),
  ProductModel(
    productName: "Pineapple",
    productImage: "assets/pineapple.png",
    price: 2.22 * 4,
    unit: "dozen",
    isFavourite: false.obs,
    quantity: 1.obs,
    //description: "",
    // rating: 4.7,
  ),
  ProductModel(
    productName: "Pineapple",
    productImage: "assets/pomegranate.png",
    price: 2.22 * 4,
    unit: "1.5 lbs",
    isFavourite: false.obs,
    quantity: 1.obs,
    //description: "",
    // rating: 4.7,
  ),
  ProductModel(
    productName: "Pineapple",
    productImage: "assets/peach.png",
    price: 2.22 * 4,
    unit: "dozen",
    isFavourite: false.obs,
    quantity: 1.obs,
    //description: "",
    // rating: 4.7,
  ),
];
