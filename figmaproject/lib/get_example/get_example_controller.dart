import 'package:figmaproject/get_example/get_example.dart';
//import 'package:figmaproject/get_example/get_example_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// install Get Package
// Chnage MaterialApp to GetMaterialApp
// for routing, we will use Get.to(<PageName()>)
// define controller and variables
// initialize controller by using Get.put
// use controller by Get.find
// use obx to see an updated data

class GetExampleScreen extends StatefulWidget {
  const GetExampleScreen({super.key});

  @override
  State<GetExampleScreen> createState() => _GetExampleScreenState();
}

class _GetExampleScreenState extends State<GetExampleScreen> {
  final inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Get.put(GetExampleController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Screen 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'Count Value: ' +
                    Get.find<GetExampleController>().count.value.toString(),
              ),
            ),
            TextFormField(
              controller: inputController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.find<GetExampleController>().count.value = int.parse(
                    inputController.text,
                  );
                  print(Get.find<GetExampleController>().count.value);
                },
                child: Text('Change value'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(GetExampleScreen2());
                },
                child: Text('Go To Second Page'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GetExampleScreen2 extends StatefulWidget {
  const GetExampleScreen2({super.key});

  @override
  State<GetExampleScreen2> createState() => _GetExampleScreen2State();
}

class _GetExampleScreen2State extends State<GetExampleScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Screen 2'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(GetExampleScreen3());
          },
          child: Text('Go to third page'),
        ),
      ),
    );
  }
}

class GetExampleScreen3 extends StatefulWidget {
  const GetExampleScreen3({super.key});

  @override
  State<GetExampleScreen3> createState() => _GetExampleScreen3State();
}

class _GetExampleScreen3State extends State<GetExampleScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Screen 3'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              'Count Value: ' +
                  Get.find<GetExampleController>().count.value.toString(),
            ),
          ),
          SizedBox(height: 10),

          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.find<GetExampleController>().count.value = 0;
                Get.offAll(GetExampleScreen());
              },
              child: Text('Back to first page'),
            ),
          ),
        ],
      ),
    );
  }
}
