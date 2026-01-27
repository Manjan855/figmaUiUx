import 'package:figmaproject/Accountfolder/Account_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CreditCards extends StatefulWidget {
  const CreditCards({super.key});

  @override
  State<CreditCards> createState() => _CreditCardsState();
}

class _CreditCardsState extends State<CreditCards> {
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
                        "My Address",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
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
                    border: OutlineInputBorder(),
                    labelText: "Russell Austin",
                    prefixIcon: SvgPicture.asset("assets/user.svg"),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "XXXX XXXX XXXX 5678",
                    prefixIcon: SvgPicture.asset("assets/card1.svg"),
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
                          border: OutlineInputBorder(),
                          labelText: "01/22",
                          prefixIcon: SvgPicture.asset("assets/calendar.svg"),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "908",
                          prefixIcon: SvgPicture.asset("assets/lock.svg"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 19),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/OnOff.svg",
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Make a default",
                        style: TextStyle(fontSize: 14),
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
