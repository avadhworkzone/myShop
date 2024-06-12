import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BottombarController extends GetxController {
  RxInt selectedIndex = RxInt(0);

  pageChange(int index) {
    selectedIndex.value = index;
  }
}
