import 'package:get/get.dart';

class GetExampleController extends GetxController {
  RxInt count = 100.obs; // int count=10;
  RxnInt nullableIntVar = RxnInt(); // int? count;

  RxString text = '10'.obs;
  RxnString nullableText = RxnString();

  RxInt intVar = 0.obs;
  RxString stringVar = 'test'.obs;

  int? intvar2;

  RxList list = [].obs;
  Rxn<List> nullableList = Rxn();

  void add() {
    count.value += 100;
  }
}
