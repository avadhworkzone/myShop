import 'package:get/get.dart';

import '../view/general/bottombar_screens/bottombar_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(()=>BottomScreen());
      // Get.to(BoardingScreen());
    });
    super.onInit();
  }
}
