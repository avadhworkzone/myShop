// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../utils/validation_utils.dart';
import '../utils/shared_preference_utils.dart';
import '../view/general/bottombar_screens/bottombar_screen.dart';

class SignInController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;

  var isVisible = true.obs;
  var selectesPageIndex = 0.obs;

  passwordVisible() {
    isVisible.value = !isVisible.value;
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    // emailController = TextEditingController(text: "demo@gmail.com");
    // passwordController = TextEditingController(text: "123456789");
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  validateEmail(value) {
    if (value.toString().isEmpty) {
      return ValidationMsg.isRequired;
    }
    if (!RegExp(RegularExpression.emailValidationPattern).hasMatch(value)) {
      return ValidationMsg.pleaseEnterValidEmail;
    }
    return null;
  }

  validatePassword(value) {
    if (value.toString().isEmpty) {
      return ValidationMsg.isRequired;
    }
    if (value.toString().length < 3) {
      return ValidationMsg.passwordLength;
    }
    return null;
  }

  checkLogin() {
    Get.offAll(
      () => BottomScreen(),
      arguments: "home",
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 500),
    );
    PreferenceUtils.setLogin(1);
  }
}
