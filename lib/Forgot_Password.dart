import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
              Text("Password Recovery"),
            ],
          ),
          SizedBox(height: 23),
          Column(
            children: [
              Text("Forgot Password"),
              Text("Lorem ipsum dolor sit amet, consetetur "),
              Text("sadipscing elitr, sed diam nonumy"),
              SizedBox(height: 23),
              TextField(
                decoration: InputDecoration(
                  labelText: " Email address",
                  prefixIcon: SvgPicture.asset("assets/mail.svg"),
                  
                ),
              ),
            ],
          ),
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
              child: Text("Send Link"),
            ),
          ),
        ],
      ),
    );
  }
}
