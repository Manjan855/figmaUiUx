import 'package:figmaproject/product_controller.dart';
import 'package:figmaproject/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyfavouritesPage extends StatefulWidget {
  const MyfavouritesPage({super.key});

  @override
  State<MyfavouritesPage> createState() => _MyfavouritesPageState();
}

class _MyfavouritesPageState extends State<MyfavouritesPage> {
  final ProductController controller = Get.find<ProductController>();
  int? counter;

  // get favouriteList => controller.favouriteList;

  @override
  void initState() {
    super.initState();
    readValue();
  }

  Future<void> readValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? storedCounter = prefs.getInt('counter');
    setState(() {
      counter = storedCounter;
    });
  }

  // void removeFromFavourite(ProductModel product) {
  //   favouriteList.remove(product);
  // }

  @override
  Widget build(BuildContext context) {
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
        if (controller.favouriteList.isEmpty) {
          return const Center(child: Text("No favourites"));
        }

        return ListView.builder(
          itemCount: controller.favouriteList.length,
          itemBuilder: (_, i) {
            final product = controller.favouriteList[i];

            return Slidable(
              key: ValueKey(product.productName),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (_) {
                      controller.removeFromFavourite(product);
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    // label: '',
                  ),
                ],
              ),
              child: CartItemTile(product: product),
            );
          },
        );
      }),
    );
  }
}
