import 'package:flutter/material.dart';

class ShippingMethod extends StatefulWidget {
  const ShippingMethod({super.key});

  @override
  State<ShippingMethod> createState() => _ShippingMethodState();
}

class _ShippingMethodState extends State<ShippingMethod> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Shipping Method",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF868889),
          ),
        ),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StepCircle(title: "Delivery", active: true),
                StepCircle(title: "ADDRESS", active: false),
                StepCircle(title: "PAYMENT", active: false),
              ],
            ),
            const SizedBox(height: 30),
            ShippingTile(
              title: "Standard Delivery",
              price: "\$3",
              selected: true,
            ),
            ShippingTile(
              title: "Next Day Delivery",
              price: "\$5",
              selected: false,
            ),
            ShippingTile(
              title: "Nominated Delivery",
              price: "\$3",
              selected: false,
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                ),
                onPressed: () {},
                child: const Text("Next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StepCircle extends StatelessWidget {
  final String title;
  final bool active;
 

  const StepCircle({super.key, required this.title, required this.active});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: active ? Colors.green : Colors.grey.shade300,
          child: Text(
            active ? "1" : "",
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 6),
        Text(title, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }
}

class ShippingTile extends StatelessWidget {
  final String title;
  final String price;
  final bool selected;

  const ShippingTile({
    super.key,
    required this.title,
    required this.price,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: selected ? Colors.green : Colors.grey.shade300,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Order will be delivered between 3-4 business days straight to your doorstep.",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
