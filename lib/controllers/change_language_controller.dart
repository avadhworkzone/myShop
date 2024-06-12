import 'package:get/get.dart';

class ChangeLanguageController extends GetxController {
  RxInt select = 0.obs;

  selectLanguage(index) {
    select.value = index;
  }

  RxList<String> language = [
    'English',
    'Chinese',
    'Spanish',
    'Hindi',
    'Arabic',
    'Portuguese',
    'Russian',
    'Japanese',
  ].obs;
}
