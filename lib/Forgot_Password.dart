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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 17,
            right: 17,
            bottom: 17,
            top: 17,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Password Recovery",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          letterSpacing: 3,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 23),
              Padding(
                padding: const EdgeInsets.only(right: 17, left: 17),
                child: Column(
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        letterSpacing: 3,
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      "Lorem ipsum dolor sit amet, consetetur ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        letterSpacing: 3,
                        color: Color(0xFF868889),
                      ),
                    ),
                    Text(
                      "sadipscing elitr, sed diam nonumy",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        letterSpacing: 3,
                        color: Color(0xFF868889),
                      ),
                    ),
                    SizedBox(height: 44),
                    TextField(
                      decoration: InputDecoration(
                        labelText: " Email address",
                        labelStyle: TextStyle(color: Color(0xFF868889)),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            "assets/email.svg",
                            height: 25,
                            width: 25,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 400),
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
                  child: Text("Send Link"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
