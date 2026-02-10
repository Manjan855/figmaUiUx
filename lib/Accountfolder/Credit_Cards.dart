import 'package:figmaproject/Accountfolder/Account_Page.dart';
import 'package:figmaproject/Accountfolder/Add_Card.dart';
import 'package:figmaproject/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CreditCards extends StatefulWidget {
  const CreditCards({super.key});

  @override
  State<CreditCards> createState() => _CreditCardsState();
}

class _CreditCardsState extends State<CreditCards> {
  final ProductController controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 17, right: 17),

          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.to(() => AccountPage());
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),

                  Expanded(
                    child: Center(
                      child: Text(
                        "My Credit Cards",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(() => AddCard());
                    },
                    icon: Icon(Icons.add_circle_outline),
                  ),
                ],
              ),
              SizedBox(height: 23),     
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 34,
                      left: 17,
                      right: 17,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // set desired height
                      children: [
                        Container(
                          width: 66,
                          height: 66,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300, // grey background
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/redyellow.svg",
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                        SizedBox(width: 15),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Master Card",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text("XXXX XXXX XXXX 5678"),
                            Row(
                              children: [
                                Text("Expiry:", style: TextStyle(fontSize: 10)),
                                Text(
                                  "01/22",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 25),
                                Text("CVV:", style: TextStyle(fontSize: 10)),
                                Text(
                                  "908",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        SvgPicture.asset("assets/up.svg"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Color(0xFFF4F5F9),
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: "Russell Austin",
                    prefixIcon: SvgPicture.asset(
                      "assets/user.svg",
                      height: 12,
                      width: 12,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Color(0xFFF4F5F9),
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: "XXXX XXXX XXXX 5678",
                    prefixIcon: SvgPicture.asset(
                      "assets/card1.svg",
                      height: 12,
                      width: 12,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Color(0xFFF4F5F9),
                          filled: true,
                          border: OutlineInputBorder(),
                          labelText: "01/22",
                          prefixIcon: SvgPicture.asset(
                            "assets/calendar.svg",
                            height: 12,
                            width: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Color(0xFFF4F5F9),
                          filled: true,
                          border: OutlineInputBorder(),
                          labelText: "908",
                          prefixIcon: SvgPicture.asset(
                            "assets/lock.svg",
                            height: 12,
                            width: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 19),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Obx(
                  () => Row(
                    children: [
                      Switch(
                        activeThumbColor: Colors.lightGreen,
                        value: controller.isDefault.value,
                        onChanged: controller.toggleDefault,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Make default",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 34),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 34,
                      left: 17,
                      right: 17,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // set desired height
                      children: [
                        Container(
                          width: 66,
                          height: 66,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300, // grey background
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/visa.svg",
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                        SizedBox(width: 15),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Visa Card",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text("XXXX XXXX XXXX 5678"),
                            Row(
                              children: [
                                Text("Expiry:", style: TextStyle(fontSize: 10)),
                                Text(
                                  "01/22",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 25),
                                Text("CVV:", style: TextStyle(fontSize: 10)),
                                Text(
                                  "908",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        SvgPicture.asset("assets/down.svg"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 34,
                      left: 17,
                      right: 17,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // set desired height
                      children: [
                        Container(
                          width: 66,
                          height: 66,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300, // grey background
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/redyellow.svg",
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                        SizedBox(width: 15),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Master Card",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text("XXXX XXXX XXXX 5678"),
                            Row(
                              children: [
                                Text("Expiry:", style: TextStyle(fontSize: 10)),
                                Text(
                                  "01/22",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 25),
                                Text("CVV:", style: TextStyle(fontSize: 10)),
                                Text(
                                  "908",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        SvgPicture.asset("assets/down.svg"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 53),
              Padding(
                padding: const EdgeInsets.only(bottom: 26, left: 17, right: 17),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    minimumSize: Size(double.infinity, 60),
                    backgroundColor: Color(0xFF6CC51D),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text("Save Settings"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
