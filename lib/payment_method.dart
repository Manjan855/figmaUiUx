import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int _activeStep = 2; // Payment step
  int selectedIndex = -1;
  bool saveCard = false; // no selection initially

  final List<PaymentItem> paymentMethods = [
    PaymentItem(name: 'paypal', image: SvgPicture.asset('assets/paypal.svg')),
    PaymentItem(name: 'card', image: SvgPicture.asset('assets/card.svg')),
    PaymentItem(name: 'apple', image: SvgPicture.asset('assets/apple.svg')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Payment Method"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 🔹 Stepper
            Padding(
              padding: const EdgeInsets.only(top: 61, left: 17, right: 17),
              child: EasyStepper(
                activeStep: _activeStep,
                lineStyle: const LineStyle(
                  lineLength: 20,
                  lineThickness: 5,
                  finishedLineColor: Colors.green,
                ),
                stepShape: StepShape.circle,
                activeStepBackgroundColor: Colors.green,
                finishedStepBackgroundColor: Colors.green,
                steps: const [
                  EasyStep(icon: Icon(Icons.check), title: 'Delivery'),
                  EasyStep(icon: Icon(Icons.check), title: 'Address'),
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.green,
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: 'Payment',
                  ),
                ],
              ),
            ),

            /// Payment Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: paymentMethods.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 22,
                  mainAxisSpacing: 22,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final item = paymentMethods[index];
                  final isSelected = selectedIndex == index;

                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? Colors.green : Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          item.image,
                          const SizedBox(height: 8),
                          Text(
                            item.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.green : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 17),
              child: SizedBox(
                width: double.infinity,
                child: Image.asset("assets/card.png", fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    cursorHeight: 20,
                    decoration: InputDecoration(
                      prefixIcon: SvgPicture.asset(
                        "assets/user.svg",
                        width: 24,
                        height: 24,
                      ),
                      labelText: 'Name on the Card',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: SvgPicture.asset(
                        "assets/card1.svg",
                        width: 24,
                        height: 24,
                      ),
                      labelText: 'Card Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.calendar_today, size: 24),
                            labelText: 'Expiry Date',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: SvgPicture.asset(
                              "assets/lock.svg",

                              width: 14,
                              height: 14,
                            ),
                            labelText: 'CVV',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Switch(
                  value: saveCard,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      saveCard = value;
                    });
                  },
                ),
                const Text("Save this card", style: TextStyle(fontSize: 16)),
              ],
            ),

            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.only(bottom: 36, left: 17, right: 17),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Color(0xFF6CC51D),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: Text("Make a Payment"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentItem {
  final String name;
  final Widget image;

  PaymentItem({required this.name, required this.image});
}
