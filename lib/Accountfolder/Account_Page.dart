import 'package:figmaproject/Accountfolder/About_Me.dart';
import 'package:figmaproject/Accountfolder/Credit_Cards.dart';
import 'package:figmaproject/Accountfolder/My_Adress.dart';
import 'package:figmaproject/Accountfolder/My_Orders.dart';
import 'package:figmaproject/Accountfolder/Notifications.dart';
import 'package:figmaproject/Accountfolder/Transactions.dart';
import 'package:figmaproject/Home_Page.dart';
import 'package:figmaproject/MyFavourites_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Profile Image
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage("assets/account.png"),
                  ),

                  // Camera Icon (Bottom Right)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // open camera / gallery
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: SvgPicture.asset(
                          "assets/camera.svg",
                          height: 22,
                          width: 22,
                          color: Colors.white, // optional
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Olivia Austian",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "oliviaaustian@example.com",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 29),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: GestureDetector(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset(
                        "assets/user.svg",
                        colorFilter: const ColorFilter.mode(
                          Colors.green,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    title: GestureDetector(
                      onTap: () {
                        Get.to(() => AboutMe());
                      },
                      child: const Text("About Me"),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        Get.to(() => AboutMe());
                      },
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ),

                  ListTile(
                    leading: SvgPicture.asset("assets/order.svg"),
                    title: Text("My Orders"),
                    trailing: GestureDetector(
                      onTap: () {
                        Get.to(() => MyOrders());
                      },
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset(
                      "assets/heart.svg",
                      colorFilter: const ColorFilter.mode(
                        Colors.green,
                        BlendMode.srcIn,
                      ),
                    ),
                    title: Text("My Favorites"),
                    trailing: GestureDetector(
                      onTap: () {
                        Get.to(() => MyfavouritesPage());
                      },
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset("assets/location.svg"),
                    title: Text("My Address"),
                    trailing: GestureDetector(
                      onTap: () {
                        Get.to(() => MyAdress());
                      },
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset(
                      "assets/card1.svg",
                      colorFilter: const ColorFilter.mode(
                        Colors.green,
                        BlendMode.srcIn,
                      ),
                    ),
                    title: Text("Credit Cards"),
                    trailing: GestureDetector(
                      onTap: () {
                        Get.to(() => CreditCards());
                      },
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset("assets/transaction.svg"),
                    title: Text("Transactions"),
                    trailing: GestureDetector(
                      onTap: () {
                        Get.to(() => Transactions());
                      },
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset("assets/notification.svg"),
                    title: Text("Notifications"),
                    trailing: GestureDetector(
                      onTap: () {
                        Get.to(() => Notifications());
                      },
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset("assets/signout.svg"),
                    title: Text("Sign Out"),
                    // trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.white,

                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(HomePage()),
                    child: SvgPicture.asset(
                      "assets/home.svg",
                      color: Colors.black,
                      height: 12,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(MyfavouritesPage()),
                    child: SvgPicture.asset(
                      "assets/heart.svg",
                      color: Colors.black,
                      height: 12,
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/bag.svg",
                    color: Colors.black,
                    height: 12,
                  ),
                  SvgPicture.asset("assets/user.svg", height: 24),
                ],
              ),
            ),
            // Positioned(
            //   top: -20,
            //   child: CircleAvatar(
            //     radius: 40,
            //     backgroundColor: Colors.green,
            //     child: Icon(Icons.shopping_bag, color: Colors.white),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
