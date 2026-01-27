import 'package:figmaproject/Accountfolder/Account_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyAdress extends StatefulWidget {
  const MyAdress({super.key});

  @override
  State<MyAdress> createState() => _MyAdressState();
}

class _MyAdressState extends State<MyAdress> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Address"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.to(() => AccountPage());
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/address.svg"),
                SizedBox(width: 15),
                Column(
                  children: [
                    Text(
                      "Russell Austin",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text("2811 Crescent Day. LA Port"),
                    Text("  California, United States 77571"),
                    Text("+1  202  555  0142 "),
                  ],
                ),
                SizedBox(width: 91),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.green,
                    size: 22,
                  ),
                ),
              ],
            ),
            SizedBox(height: 23),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0), // keeps icon centered
                  child: SvgPicture.asset(
                    "assets/user.svg",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),

            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Adress',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0), // keeps icon centered
                  child: SvgPicture.asset(
                    "assets/address.svg",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'City',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0), // keeps icon centered
                  child: SvgPicture.asset(
                    "assets/city.svg",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Zip code',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0), // keeps icon centered
                  child: SvgPicture.asset(
                    "assets/zipcode.svg",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Country',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0), // keeps icon centered
                  child: SvgPicture.asset(
                    "assets/country.svg",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    "assets/telephone.svg",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 23),
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  SvgPicture.asset("assets/OnOff.svg", width: 20, height: 20),
                  const SizedBox(width: 8),
                  const Text("Make a default", style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            SizedBox(height: 31),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/address.svg"),
                SizedBox(width: 15),
                Column(
                  children: [
                    Text(
                      "Jissica Simpson",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text("2811 Crescent Day. LA Port"),
                    Text("  California, United States 77571"),
                    Text("+1  202  555  0142 "),
                  ],
                ),
                SizedBox(width: 91),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.green,
                    size: 22,
                  ),
                ),
              ],
            ),
            SizedBox(height: 57),
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
