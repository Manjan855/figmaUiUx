import 'package:figmaproject/Accountfolder/Account_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 17, right: 17),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.to(() => AccountPage());
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Notifications",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 33),
            Container(
              height: 103,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Allows Notifications",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,

                            height: 1,
                          ),
                        ),
                        SizedBox(height: 18),
                        Text(
                          "Lorem ipsum dolor sit amet, consetetur sadi",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "pscing elitr, sed diam nonumym",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SvgPicture.asset("assets/OnOff.svg"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 103,

              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email Notifications",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,

                            height: 1,
                          ),
                        ),
                        SizedBox(height: 18),
                        Text(
                          "Lorem ipsum dolor sit amet, consetetur sadi",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "pscing elitr, sed diam nonumym",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SvgPicture.asset("assets/OnOff.svg"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 103,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order Notifications",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,

                            height: 1,
                            color: Color(0xFF000000),
                          ),
                        ),
                        SizedBox(height: 18),
                        Text(
                          "Lorem ipsum dolor sit amet, consetetur sadi",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "pscing elitr, sed diam nonumym",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SvgPicture.asset("assets/OnOff.svg"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 103,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "General Notifications",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,

                            height: 1,
                          ),
                        ),
                        SizedBox(height: 18),
                        Text(
                          "Lorem ipsum dolor sit amet, consetetur sadi",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "pscing elitr, sed diam nonumym",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SvgPicture.asset("assets/OnOff.svg"),
                  ],
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 36, left: 17, right: 17),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
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
    );
  }
}
