// ignore_for_file: file_names
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../utils/validation_utils.dart';
import '../view/login/signIn.dart';

class SignUpController extends GetxController {
  var selectesPageIndex = 0.obs;
  late TextEditingController nameController,
      emailController,
      contactController,
      passwordController,
      confirmPassword;
  // GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  var isVisible1 = false.obs;
  var isVisible2 = false.obs;

  passwordVisible() {
    isVisible1.value = !isVisible1.value;
  }

  confitmPasswordVisible() {
    isVisible2.value = !isVisible2.value;
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    contactController = TextEditingController();
    passwordController = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    contactController.dispose();
    confirmPassword.dispose();
  }

  validateName(value) {
    if (value.isEmpty) {
      return ValidationMsg.isRequired;
    }
    if (!RegExp(RegularExpression.alphabetSpacePattern).hasMatch(value)) {
      return ValidationMsg.pleaseEnterValidDetails;
    }
    return null;
  }

  validateEmail(value) {
    if (value.toString().isEmpty) {
      return ValidationMsg.isRequired;
    }
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
    if ((value.toString().length < 6)) {
      return ValidationMsg.passwordLength;
    } else if (passwordController.text != confirmPassword.text) {
      return ValidationMsg.passwordDoesNotMatch;
    }
    return null;
  }

  validateConfirmassword(value) {
    if (value.toString().isEmpty) {
      return ValidationMsg.isRequired;
    }
    if ((value.toString().length < 6)) {
      return ValidationMsg.passwordLength;
    } else if (passwordController.text != confirmPassword.text) {
      return ValidationMsg.passwordDoesNotMatch;
    } else {
      return null;
    }
  }

  ckeckSignUp() {
    Get.offAll(
      () => SignIn(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 500),
    );
  }
}

// Multiple widgets used the same GlobalKey.
// Duplicate GlobalKey detected in widget tree.
