// ignore_for_file: file_names
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../utils/validation_utils.dart';
import '../view/general/bottombar_screens/more/change_password.dart';

class ForgotPasswordController extends GetxController {
  var selectesPageIndex = 0.obs;
  late TextEditingController emailController;
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  var isVisible = true.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  validateEmail(value) {
    if (value.isEmpty) {
      return ValidationMsg.isRequired;
    }
    if (!RegExp(RegularExpression.emailValidationPattern).hasMatch(value)) {
      return ValidationMsg.pleaseEnterValidEmail;
    }
    return null;
  }

  checkForgot() {
    Get.to(() => const ChangePassword(), arguments: emailController.text);
    forgotPasswordFormKey.currentState!.save();
  }
}
