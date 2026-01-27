import 'package:figmaproject/Accountfolder/Account_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  Widget orderStep({
    required String title,
    required String date,
    required bool isActive,
    bool showLine = true,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline indicator
        Column(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: isActive ? Colors.green : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            if (showLine)
              Container(
                width: 2,
                height: 15,
                color: isActive ? Colors.green : Colors.grey.shade300,
              ),
          ],
        ),

        const SizedBox(width: 10),

        // Text section
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isActive ? Colors.black : Colors.grey,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  color: isActive ? Colors.black54 : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 17, right: 17),
          child: ColoredBox(
            color: Colors.white,
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
                            "My Orders",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 23),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17, right: 17),

                      child: Row(
                        children: [
                          Container(
                            width: 66,
                            height: 66,
                            decoration: BoxDecoration(
                              color: Color(0xFFEBFFD7), // grey background
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/orders.svg",
                                width: 42,
                                height: 29.24,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Order #90897",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Placed on October 19 2021",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF868889),
                                ),
                              ),
                              Text(
                                "Items: 10    Total: \$16.90",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          SvgPicture.asset("assets/up.svg"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17, right: 17),
                      child: Column(
                        children: [
                          orderStep(
                            title: "Order placed",
                            date: "Oct 19 2021",
                            isActive: true,
                          ),
                          const SizedBox(height: 15),

                          orderStep(
                            title: "Order confirmed",
                            date: "Oct 20 2021",
                            isActive: true,
                          ),
                          const SizedBox(height: 15),

                          orderStep(
                            title: "Order shipped",
                            date: "Oct 20 2021",
                            isActive: true,
                          ),
                          const SizedBox(height: 15),

                          orderStep(
                            title: "Out for delivery",
                            date: "Pending",
                            isActive: false,
                          ),
                          const SizedBox(height: 15),

                          orderStep(
                            title: "Order delivered",
                            date: "Pending",
                            isActive: false,
                            showLine: false, // last item
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 25),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17, right: 17),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 66,
                            height: 66,
                            decoration: BoxDecoration(
                              color: Color(0xFFEBFFD7), // grey background
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/orders.svg",
                                width: 42,
                                height: 29.24,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Order #90897",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Placed on October 19 2021",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF868889),
                                ),
                              ),
                              Text(
                                "Items: 10    Total: \$16.90",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          SvgPicture.asset("assets/down.svg"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 66,
                          height: 66,
                          decoration: BoxDecoration(
                            color: Color(0xFFEBFFD7), // grey background
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/orders.svg",
                                width: 42,
                                height: 29.24,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order #90897",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Placed on October 19 2021",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF868889),
                              ),
                            ),
                            Text(
                              "Items: 10    Total: \$16.90",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Order delivered",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF868889),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  "Aug 29 2021",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF868889),
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

                  SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 66,
                          height: 66,
                          decoration: BoxDecoration(
                            color: Color(0xFFEBFFD7), // grey background
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/orders.svg",
                              width: 42,
                              height: 29.24,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Order #90897",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text(
                              "Placed on October 19 2021",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF868889),
                              ),
                            ),
                            const Text(
                              "Items: 10    Total: \$16.90",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "Order delivered",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF868889),
                                  ),
                                ),

                                const Text(
                                  "Aug 29 2021",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF868889),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
