import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';
import 'api_service.dart';
import 'combine_model.dart';

class CombinedController extends GetxController {
  final ApiService _apiService = ApiService();

  RxBool isLoading = false.obs;
  Rx<CombinedModel?> combinedData = Rx<CombinedModel?>(null);
  RxString errorMessage = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchCombinedData();
  }

  Future<void> fetchCombinedData() async {
    try {
      isLoading.value = true;
      errorMessage.value = "";

      Response response = await _apiService.getCombinedData();

      if (response.statusCode == 200) {
        combinedData.value = CombinedModel.fromJson(response.data);
      } else {
        errorMessage.value = "Something went wrong";
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
