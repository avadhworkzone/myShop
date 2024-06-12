import 'package:get/get.dart';

class DeliveryController extends GetxController {
  var isIncrement = 0.obs;
  RxInt currentDots = RxInt(0);

  increment() {
    isIncrement.value++;
    update();
  }

  decrement() {
    if (isIncrement.value > 0) {
      isIncrement.value--;
    }
    update();
  }

  slide(val) {
    currentDots.value = val;
    update();
  }
}
