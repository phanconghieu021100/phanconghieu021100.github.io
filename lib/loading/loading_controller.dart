import 'package:get/get.dart';

class LoadingController extends GetxController {
  var isLoading = false.obs;

  void showLoading() {
    isLoading.value = true;
  }

  void hideLoading() {
    isLoading.value = false;
  }

  void performLongRunningTask() async {
  final LoadingController loadingController = Get.find();
  loadingController.showLoading();
  
  // Thực hiện hành động lâu dài
  await Future.delayed(Duration(seconds: 3)); // Simulate a delay

  loadingController.hideLoading();
}
}
