import 'package:get/get.dart';
import 'package:mobile_apps/core.dart';

class SplashscreenController extends GetxController {
  SplashscreenView? view;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.offAll(const DashboardView());
    });
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
