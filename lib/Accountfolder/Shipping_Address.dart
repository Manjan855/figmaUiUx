import 'package:easy_stepper/easy_stepper.dart';
import 'package:figmaproject/get_example/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  int _activeStep = 2; // Payment step
  int selectedIndex = -1;
  final ProductController controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 61, left: 17, right: 17),
            child: EasyStepper(
              activeStep: _activeStep,
              lineStyle: const LineStyle(
                lineLength: 20,
                lineThickness: 5,
                finishedLineColor: Colors.green,
              ),
              stepShape: StepShape.circle,
              activeStepBackgroundColor: Colors.green,
              finishedStepBackgroundColor: Colors.green,
              steps: const [
                EasyStep(icon: Icon(Icons.check), title: 'Delivery'),
                EasyStep(icon: Icon(Icons.check), title: 'Address'),
                EasyStep(
                  customStep: CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.green,
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: 'Payment',
                ),
              ],
            ),
          ),

          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          Expanded(
            child: Center(
              child: Text(
                "Add Card",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(height: 23),
          Padding(
            padding: const EdgeInsets.only(left: 17, right: 17),
            child: Container(child: Image.asset("assets/cards.png")),
          ),
          SizedBox(height: 23),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  "assets/user.svg",
                  height: 25,
                  width: 25,
                ),
              ),
              labelText: "Name of the card",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  "assets/user.svg",
                  height: 25,
                  width: 25,
                ),
              ),
              labelText: "Name of the card",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      "assets/user.svg",
                      height: 25,
                      width: 25,
                    ),
                  ),
                  labelText: "Name of the card",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(width: 5),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      "assets/user.svg",
                      height: 25,
                      width: 25,
                    ),
                  ),
                  labelText: "Name of the card",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Obx(
            () => Row(
              children: [
                Switch(
                  activeThumbColor: Colors.lightGreen,
                  value: controller.shippingAddress.value,
                  onChanged: controller.toggleShippingAddress,
                ),
                const SizedBox(width: 8),
                const Text(
                  "Save this address",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 17, right: 17, bottom: 36),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Color(0xFF6CC51D),
                shadowColor: Color(0xFFAEDC81),
                minimumSize: Size(double.infinity, 60),
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: Text(
                "Add address",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
