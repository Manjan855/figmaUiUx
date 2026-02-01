import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'Otp_page.dart';

class VerifyNumber extends StatefulWidget {
  const VerifyNumber({super.key});

  @override
  State<VerifyNumber> createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  late final TextEditingController phoneController;
  late final TextEditingController codeController;
  Country? selectedCountry;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    codeController = TextEditingController(text: "+1");
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    codeController.dispose();
  }

  // class _VerifyNumberState extends State<VerifyNumber> {
  //   late final TextEditingController phoneController;
  //   late final TextEditingController codeController;

  //   Country? selectedCountry;

  //   @override
  //   void initState() {
  //     super.initState();
  //     phoneController = TextEditingController();
  //     codeController = TextEditingController(text: "+1"); // default
  //   }

  //   @override
  //   void dispose() {
  //     phoneController.dispose();
  //     codeController.dispose();
  //     super.dispose();
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Verify Number"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),

            const Text(
              "Verify your number",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            const Text(
              "Lorem ipsum dolor sit amet, consetetur\nsadipscing elitr, sed diam nonumy",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 40),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      showPhoneCode: true,
                      onSelect: (country) {
                        setState(() {
                          selectedCountry = country;
                          codeController.text = "+${country.phoneCode}";
                        });
                      },
                    );
                  },
                  child: Container(
                    height: 55,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(codeController.text),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: "2055550145",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),

            // Phone Input
            // Row(
            //   children: [
            //     /// Country Picker
            //     GestureDetector(
            //       onTap: () {
            //         showCountryPicker(
            //           context: context,
            //           showPhoneCode: true,

            //           onSelect: (country) {
            //             setState(() {
            //               selectedCountry = country;
            //               codeController.text = "+${country.phoneCode}";
            //             });
            //           },
            //         );
            //       },
            //       child: Container(
            //         height: 55,
            //         padding: const EdgeInsets.symmetric(horizontal: 12),
            //         decoration: BoxDecoration(
            //           border: Border.all(color: Colors.grey.shade400),
            //           borderRadius: BorderRadius.circular(8),
            //         ),
            //         child: Row(
            //           children: [
            //             Text(codeController.text),
            //             const Icon(Icons.arrow_drop_down),
            //           ],
            //         ),
            //       ),
            //     ),

            //     const SizedBox(width: 10),

            //     /// Phone Number
            //     Expanded(
            //       child: TextField(
            //         controller: phoneController,
            //         keyboardType: TextInputType.phone,
            //         decoration: const InputDecoration(
            //           hintText: "2055550145",
            //           border: OutlineInputBorder(),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 30),

            /// Next Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const OtpPage()),
                  );
                },
                child: const Text("Next"),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Resend confirmation code (1:23)",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
