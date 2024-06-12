import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/utils/color_utils.dart';
import '../utils/validation_utils.dart';
import '../commanWidget/custom_snackbar.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileController extends GetxController {
  var selectedImagePath = ''.obs;

  var dt = DateTime.now();
  late TextEditingController emailController,
      dateOfBirthController,
      firstNameController,
      lastNameController,
      contactController,
      address1Controller,
      address2Controller,
      countryController,
      cityController,
      stateController;

  @override
  void onInit() {
    super.onInit();
    dateOfBirthController = TextEditingController(text: '');
    cityController = TextEditingController(text: '');
    stateController = TextEditingController(text: '');
    emailController = TextEditingController(text: '');
    countryController = TextEditingController(text: '');
    contactController = TextEditingController(text: '');
    address1Controller = TextEditingController(text: '');
    address2Controller = TextEditingController(text: '');
    lastNameController = TextEditingController(text: '');
    firstNameController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    dateOfBirthController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    address1Controller.dispose();
    address2Controller.dispose();
    contactController.dispose();
    countryController.dispose();
    emailController.dispose();
    stateController.dispose();
    cityController.dispose();
    selectedImagePath.value = "";
    super.dispose();
  }

  CustomSnackbar snackbar = CustomSnackbar();

  imageCamera(context,ImageSource source) async {
    final pickedFile =
        // ignore: deprecated_member_use
        await ImagePicker().getImage(source: source, imageQuality: 75);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      Get.back();
    } else {
      snackbar.customSnackBar(
        context,
        "Image not selected",
        ColorUtils.red42,
      );
      Get.back();
    }
  }

  validateEmail(value) {
    if (value.isEmpty ||
        !RegExp(RegularExpression.emailValidationPattern).hasMatch(value)) {
      return ValidationMsg.pleaseEnterValidEmail;
    }
    return null;
  }

  validateFirstName(value) {
    if (value.isEmpty ||
        !RegExp(RegularExpression.alphabetPattern).hasMatch(value)) {
      return ValidationMsg.pleaseEnterFirstName;
    }
    return null;
  }

  validateLastName(value) {
    if (value.isEmpty ||
        !RegExp(RegularExpression.alphabetPattern).hasMatch(value)) {
      return ValidationMsg.pleaseEnterLastName;
    }
    return null;
  }

  validateDob(value) {
    if (value.isEmpty) {
      return ValidationMsg.selectDob;
    }
    return null;
  }

  validateAddress1(value) {
    if (value.isEmpty ||
        !RegExp(RegularExpression.addressValidationPattern).hasMatch(value)) {
      return ValidationMsg.pleaseEnterAddress;
    }
    return null;
  }

  validateCity(value) {
    if (value.isEmpty ||
        !RegExp(RegularExpression.alphabetPattern).hasMatch(value)) {
      return ValidationMsg.pleaseEnterCityName;
    }
    return null;
  }

  validateState(value) {
    if (value.isEmpty ||
        !RegExp(RegularExpression.alphabetPattern).hasMatch(value)) {
      return ValidationMsg.pleaseEnterStateName;
    }
    return null;
  }

  validateCountry(value) {
    if (value.isEmpty ||
        !RegExp(RegularExpression.alphabetPattern).hasMatch(value)) {
      return ValidationMsg.pleaseEnterCountryName;
    }
    return null;
  }

  validateAddress2(value) {
    //  if (value.isEmpty ||
    //     !RegExp(RegularExpression.addressValidationPattern).hasMatch(value)) {
    //   return ValidationMsg.pleaseEnterAddress;
    // }
    // return null;
  }

  checkProfile(context) {
   
    if (selectedImagePath.value == "") {
      snackbar.customSnackBar(
        context,
        "Image not selected",
        ColorUtils.red42,
      );
      return;
    }
    snackbar.customSnackBar(
      context,
      "Profile successfully updated",
      ColorUtils.green25,
    );
  }
}
