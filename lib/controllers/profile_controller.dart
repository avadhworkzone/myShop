import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../utils/validation_utils.dart';

class ProfileController extends GetxController {
  late TextEditingController addressController,
      emailController,
      contactController,
      genderController,
      dateOfBirthController;
  final GlobalKey<FormState> editProfileFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    addressController = TextEditingController(
      text: 'Near Sodala, Jaipur, Raj. (302006)',
    );
    emailController = TextEditingController(text: 'zack.poster@gmail.com');
    contactController = TextEditingController(text: '+91-987-6543-210');
    genderController = TextEditingController(text: 'Male');
    dateOfBirthController = TextEditingController(text: 'Jan 05, 1990');
  }

  @override
  void dispose() {
    super.dispose();
    addressController.dispose();
    emailController.dispose();
    genderController.dispose();
    contactController.dispose();
    dateOfBirthController.dispose();
  }

  validateName(value) {
    if (value.isEmpty ||
        !RegExp(RegularExpression.alphabetSpacePattern).hasMatch(value)) {
      return ValidationMsg.pleaseEnterValidDetails;
    }
    return null;
  }

  validateContact(value) {
    if (value.isEmpty ||
        !RegExp(RegularExpression.alphabetSpacePattern).hasMatch(value)) {
      return ValidationMsg.mobileNoLength;
    }
    return null;
  }

  validateEmail(value) {
    if (value.isEmpty ||
        !RegExp(RegularExpression.emailValidationPattern).hasMatch(value)) {
      return ValidationMsg.pleaseEnterValidEmail;
    }
    return null;
  }


}
