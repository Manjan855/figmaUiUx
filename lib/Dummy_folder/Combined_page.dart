import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'combined_controller.dart';

class CombinedPage extends StatelessWidget {
  CombinedPage({super.key});

  final CombinedController controller = Get.put(CombinedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Combined Data")),
      body: Padding(
        padding: const EdgeInsets.only(left: 17, right: 17),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.errorMessage.isNotEmpty) {
            return Center(child: Text(controller.errorMessage.value));
          }

          if (controller.combinedData.value == null) {
            return const Center(child: Text("No data"));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Text(
              controller.combinedData.value!.data.toString(),
              style: const TextStyle(fontSize: 14),
            ),
          );
        }),
      ),
    );
  }
}
