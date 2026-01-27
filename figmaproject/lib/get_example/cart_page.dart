import 'package:figmaproject/get_example/products_controller.dart';
import 'package:figmaproject/product_list.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart Page')),
      body: Get.find<ProductController>().productCartList.isEmpty
          ? Center(child: Text('No product added to cart'))
          : ListView.builder(
              itemCount: Get.find<ProductController>().productCartList.length,
              itemBuilder: (_, i) {
                final product =
                    Get.find<ProductController>().productCartList[i];
                return Slidable(
                  key: ValueKey(product.productName),
                  startActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_) => Get.find<ProductController>()
                            .deleteItemFromCart(product),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                      SlidableAction(
                        onPressed: (_) {},
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        icon: Icons.more,
                        label: 'More',
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_) => Get.find<ProductController>()
                            .deleteItemFromCart(product),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                      SlidableAction(
                        onPressed: (_) {},
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        icon: Icons.more,
                        label: 'More',
                      ),
                    ],
                  ),

                  child: ProductTile(product: product),
                );
              },
            ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final ProductModel product;

  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            product.productImage,
            width: 55,
            height: 55,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.broken_image, size: 55),
          ),
        ),
        title: Text(
          product.productName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        // subtitle: Text(
        //   'Rs ${product.price} / ${product.unit}\n${product.description}',
        // ),
        isThreeLine: true,
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, color: Colors.orange, size: 18),
            // Text(product.rating.toString()),
            Text(product.quantity.toString()),
          ],
        ),
      ),
    );
  }
}
