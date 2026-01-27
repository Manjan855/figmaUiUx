import 'package:figmaproject/Accountfolder/Account_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AccountPage()),
            );
          },
        ),
        title: Text("About Me", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17, right: 17),
            child: const Text(
              "Personal Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.only(left: 17, right: 17),
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Russell Austin',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    "assets/user.svg",
                    height: 18,
                    width: 18,
                    // optional
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'russell.partner@gmail.com',
                prefixIcon: Padding(
                  padding: EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    "assets/mailbox.svg",
                    height: 18,
                    width: 18,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 17, right: 17),
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: '+1 202 555 0142',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    "assets/telephone.svg",
                    height: 18,
                    width: 18,
                    // optional
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 34),
          Padding(
            padding: const EdgeInsets.only(left: 17, right: 17),
            child: Text(
              "Change Password",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 17, right: 17),
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Current Password',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    "assets/lock.svg",
                    height: 18,
                    width: 18,
                    // optional
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 17, right: 17),
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: '............',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    "assets/lock.svg",
                    height: 18,
                    width: 18,
                    // optional
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    "assets/eye.svg",
                    height: 18,
                    width: 18,
                    // optional
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 17, right: 17),
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Confirm Password',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    "assets/lock.svg",
                    height: 18,
                    width: 18,
                    // optional
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 17, right: 17, bottom: 36),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),

                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Color(0xFF6CC51D),
              ),
              onPressed: () {},
              child: const Text(
                "Save Settings",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
