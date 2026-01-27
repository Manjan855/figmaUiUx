import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountController extends GetxController {
  RxInt count = 10.obs;
  RxString text = '10'.obs;
}

class GetExampleScreen extends StatefulWidget {
  const GetExampleScreen({super.key});

  @override
  State<GetExampleScreen> createState() => _GetExampleScreenState();
}

class _GetExampleScreenState extends State<GetExampleScreen> {
  final controller = Get.put(CountController());
  final inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    Get.find<CountController>().count.value.toString(),
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
                  Get.find<CountController>().count.value = int.parse(
                    inputController.text,
                  );
                  print(Get.find<CountController>().count.value);
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
                  Get.find<CountController>().count.value.toString(),
            ),
          ),
          SizedBox(height: 10),

          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.find<CountController>().count.value = 0;
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