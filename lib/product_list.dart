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
              onTap: () => controller.increases(product),
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
              onTap: () => controller.decreases(product),
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
  final bool istag;
  final String description;
  final double rating;

  ProductModel({
    required this.productName,
    required this.productImage,
    required this.price,
    required this.unit,
    required this.quantity,
    required this.isFavourite,
    this.isNew = true,
    this.istag = true,
    required this.description,
    required this.rating,
  });
}

// Sample product list
final List<ProductModel> productList = [
  ProductModel(
    productName: "Fresh brocoli",
    productImage: "assets/broccoli.png",
    price: 2.22 * 4,
    unit: "1.50 lbs",
    isFavourite: true.obs,
    isNew: false,
    quantity: 1.obs,

    description:
        "Fresh broccoli is carefully harvested from trusted farms to ensure maximum freshness and nutrition. It has firm green florets and crisp stems with a mild, earthy flavor. Broccoli is rich in vitamins, fiber, and antioxidants, making it perfect for steaming, stir-frying, or adding to healthy meals.",
    rating: 4.5,
  ),
  ProductModel(
    productName: "Black Grapes",
    productImage: "assets/grapes.png",
    price: 2.22 * 4,
    unit: "5.0 lbs",
    isFavourite: true.obs,
    quantity: 1.obs,
    istag: true,
    description:
        "Black grapes are freshly picked to offer a sweet, juicy taste with a soft texture. They have deep purple skin and are rich in natural antioxidants. Black grapes are perfect for snacking, fruit salads, desserts, and juices, providing a refreshing and nutritious option.",
    rating: 4.2,
  ),
  ProductModel(
    productName: "Avacado",
    productImage: "assets/avocado.png",
    price: 2.22 * 4,
    unit: "1.50lbs",
    isFavourite: true.obs,
    quantity: 1.obs,
    description:
        "Fresh avocados are harvested at the right stage to ensure a creamy texture and rich, buttery flavor. They have smooth green flesh that is packed with healthy fats and nutrients. Avocados are ideal for salads, spreads, smoothies, and making delicious guacamole.",
    rating: 4.7,
  ),
  ProductModel(
    productName: "Pineapple",
    productImage: "assets/pineapple.png",
    price: 2.22 * 4,
    unit: "dozen",
    isFavourite: true.obs,
    quantity: 1.obs,
    description:
        "Fresh pineapple is sourced from tropical farms and ripened naturally for a sweet and juicy taste. It has golden flesh with a refreshing balance of sweetness and acidity. Pineapple is ideal for fresh snacking, juices, smoothies, desserts, and adds a bright flavor to both sweet and savory dishes.",
    rating: 4.7,
  ),
  ProductModel(
    productName: "Pomegranate",
    productImage: "assets/pomegranate.png",
    price: 2.22 * 4,
    unit: "1.5 lbs",
    isFavourite: true.obs,
    quantity: 1.obs,
    description:
        "Pomegranates are carefully selected for their deep color and juicy ruby-red seeds. Each fruit is packed with a sweet-tart flavor and rich antioxidants. Pomegranate seeds are perfect for fresh consumption, salads, juices, and garnishing dishes, providing both taste and health benefits.",
    rating: 4.7,
  ),
  ProductModel(
    productName: "Fresh Peach",
    productImage: "assets/peach.png",
    price: 2.22 * 4,
    unit: "dozen",
    isFavourite: true.obs,
    quantity: 1.obs,
    description:
        "Fresh peaches are hand-picked at peak ripeness to deliver a soft, juicy texture and naturally sweet aroma. They have smooth skin with vibrant color and tender flesh inside. Peaches are perfect for fresh eating, baking, salads, and desserts, offering a delicious and refreshing experience.",
    rating: 4.7,
  ),
  ProductModel(
    productName: "lemon",
    productImage: "assets/lime.png",
    price: 2.22 * 4,
    unit: "dozen",
    isFavourite: true.obs,
    quantity: 1.obs,
    description:
        "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing",
    rating: 4.7,
  ),
];
