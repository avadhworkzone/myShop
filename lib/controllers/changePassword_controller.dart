// ignore_for_file: file_names

import 'package:get/get.dart';
import '../utils/color_utils.dart';
import 'package:flutter/material.dart';
import '../utils/validation_utils.dart';
import '../commanWidget/custom_snackbar.dart';

class ChangePasswordController extends GetxController {
  late TextEditingController currentController,
      newController,
      confirmController,
      otpController;

  var currentPasswordVisible = false.obs;
  var newPasswordVisible = false.obs;
  var confirmPasswordVisible = false.obs;
  var otpVisible = false.obs;

  passwordVisible1() {
    currentPasswordVisible.value = !currentPasswordVisible.value;
  }

  passwordVisible2() {
    newPasswordVisible.value = !newPasswordVisible.value;
  }

  passwordVisible3() {
    confirmPasswordVisible.value = !confirmPasswordVisible.value;
  }

  passwordVisible4() {
    otpVisible.value = !otpVisible.value;
  }

  @override
  void onInit() {
    super.onInit();
    currentController = TextEditingController();
    newController = TextEditingController();
    confirmController = TextEditingController();
    otpController = TextEditingController();
  }

  @override
  void dispose() {
    currentController.dispose();
    newController.dispose();
    confirmController.dispose();
    otpController.dispose();
    super.dispose();
  }

  validateCurrent(value) {
    if (value.toString().isEmpty) {
      return ValidationMsg.isRequired;
    }

    if (value.toString().length < 3) {
      return ValidationMsg.passwordLength;
    }
    return null;
  }

  validateOTP(value) {
    if (value.toString().isEmpty) {
      return ValidationMsg.isRequired;
    }
    return null;
  }

  validatePassword(value) {
    if (value.toString().isEmpty) {
      return ValidationMsg.passwordLength;
    }
    if (newController.text != confirmController.text) {
      return ValidationMsg.passwordDoesNotMatch;
    } else if (value.toString().length < 6) {
      return ValidationMsg.passwordLength;
    }

    return null;
  }

  checkProfile(context) {
    if (newController.text != confirmController.text) {
      return ValidationMsg.passwordLength;
    }
    // snackbar.customSnackBar(
    //   context,
    //   "password change successfully",
    //   ColorUtils.green25,
    // );
  }

  CustomSnackbar snackbar = CustomSnackbar();
}
