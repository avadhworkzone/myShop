import 'package:get/get.dart';

class PaymentController extends GetxController {
  var index1 = 1.obs;
  var payment = 'payment';
  var selectMethod = Rx<String>("1");

  paymentChange(val) {
    selectMethod.value = val;
  }
}
