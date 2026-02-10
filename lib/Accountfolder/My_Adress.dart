import 'package:figmaproject/Accountfolder/Account_Page.dart';
import 'package:figmaproject/Accountfolder/Add_Address.dart';
//import 'package:figmaproject/Accountfolder/Add_Address.dart';
import 'package:figmaproject/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyAdress extends StatefulWidget {
  const MyAdress({super.key});

  @override
  State<MyAdress> createState() => _MyAdressState();
}

class _MyAdressState extends State<MyAdress> {
  //bool isPlaying = false;
  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProductController());
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

        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => AddAddress());
            },
            icon: const Icon(Icons.add_circle_outline),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/address.svg"),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Russell Austin",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "2811 Crescent Day. LA Port",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: Color(0xFF868889),
                        ),
                      ),
                      Text(
                        "  California, United States 77571",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: Color(0xFF868889),
                        ),
                      ),
                      Text(
                        "+1  202  555  0142 ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset("assets/up.svg"),
                  ),
                ],
              ),
              SizedBox(height: 23),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF4F5F9),
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
                  filled: true,
                  fillColor: Color(0xFFF4F5F9),
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0), // keeps icon centered
                    child: SvgPicture.asset(
                      "assets/address.svg",
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        Color(0xFF868889),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF4F5F9),
                        border: OutlineInputBorder(),
                        labelText: 'City',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(
                            12.0,
                          ), // keeps icon centered
                          child: SvgPicture.asset(
                            "assets/city.svg",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF4F5F9),
                        border: OutlineInputBorder(),
                        labelText: 'Zip code',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(
                            12.0,
                          ), // keeps icon centered
                          child: SvgPicture.asset(
                            "assets/zipcode.svg",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF4F5F9),
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
                  filled: true,
                  fillColor: Color(0xFFF4F5F9),
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
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Obx(
                  () => Row(
                    children: [
                      Switch(
                        activeThumbColor: Colors.lightGreen,
                        value: controller.isDefault.value,
                        onChanged: controller.toggleDefault,
                      ),
                      const SizedBox(width: 8),
                      const Text("Make default"),
                      const Spacer(),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 31),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/address.svg"),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jissica Simpson",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "2811 Crescent Day. LA Port",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: Color(0xFF868889),
                        ),
                      ),
                      Text(
                        "  California, United States 77571",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: Color(0xFF868889),
                        ),
                      ),
                      Text(
                        "+1  202  555  0142 ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset("assets/down.svg"),
                  ),
                ],
              ),
              SizedBox(height: 25),
              //Spacer(),
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
      ),
    );
  }
}
