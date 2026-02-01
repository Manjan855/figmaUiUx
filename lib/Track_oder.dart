import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'product_controller.dart';

class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Track Order"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              orderInfoCard(),
              const SizedBox(height: 20),
              Obx(
                () => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 6),
                    ],
                  ),
                  child: Column(
                    children: [
                      orderStep(
                        imageUrl: "assets/orders.svg",
                        title: "Order Placed",
                        date: "October 21 2021",
                        isActive: controller.isActive(0),
                        showLine: true,
                      ),
                      orderStep(
                        imageUrl: "assets/ordercon.svg",
                        title: "Order Confirmed",
                        date: "October 21 2021",
                        isActive: controller.isActive(1),
                        showLine: true,
                      ),
                      orderStep(
                        imageUrl: "assets/ordership.svg",
                        title: "Order Shipped",
                        date: "October 21 2021",
                        isActive: controller.isActive(2),
                        showLine: true,
                      ),
                      orderStep(
                        imageUrl: "assets/orderdel.svg",
                        title: "Out for Delivery",
                        date: "Pending",
                        isActive: controller.isActive(3),
                        showLine: true,
                      ),
                      orderStep(
                        imageUrl: "assets/orderdevrd.svg",
                        title: "Order Delivered",
                        date: "Pending",
                        isActive: controller.isActive(4),
                        showLine: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Order Info Card
  Widget orderInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.green.shade100,
            child: SvgPicture.asset("assets/order.svg", width: 25, height: 25),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Order #90897",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "Placed on October 21 2021",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                "Items: 10   Items: \$169.0",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///  Timeline Step
  Widget orderStep({
    required String imageUrl,
    required String title,
    required String date,
    required bool isActive,
    required bool showLine,
  }) {
    return SingleChildScrollView(
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: isActive
                      ? Colors.green.shade100
                      : Colors.grey.shade200,
                  child: SvgPicture.asset(
                    imageUrl,
                    width: 30,
                    height: 30,

                    fit: BoxFit.contain,
                  ),
                ),
                if (showLine)
                  Container(
                    width: 2,
                    height: 40,
                    color: isActive ? Colors.green : Colors.grey.shade300,
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: isActive ? Colors.black : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
