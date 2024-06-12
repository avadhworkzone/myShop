// ignore_for_file: library_private_types_in_public_api
import 'dart:io';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/variable_utils.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../utils/font_style_utils.dart';
import '../../../../utils/decoration_utils.dart';
import '../../../../commanWidget/custom_btn.dart';
import '../../../../utils/size_config_utils.dart';
import '../../../../utils/assets/icons_utils.dart';
import '../../../../utils/assets/images_utils.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../commanWidget/common_textFormField.dart';
import '../../../../controllers/update_profile_controller.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  UpdateProfileController updateProfileController =
      Get.put(UpdateProfileController());
  final profileFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          highlightColor: ColorUtils.transparent,
          splashColor: ColorUtils.transparent,
          onTap: () => Get.back(),
          child: IconUtils.backArrow,
        ),
        elevation: 1.0,
        title: const Text(VariableUtils.updateProfileText),
        backgroundColor: ColorUtils.primaryColor,
        actions: [
          InkWell(
            highlightColor: ColorUtils.transparent,
            splashColor: ColorUtils.transparent,
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(top: 1.w, right: 2.w),
              child: ImagesWidgets.editAppbarImage,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: profileFormKey,
            child: Obx(
              () => Column(
                children: [
                  SizeConfig.sH2,
                  SizedBox(
                    width: 50.w,
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: 40.w,
                            width: 40.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40.w),
                              child: updateProfileController
                                          .selectedImagePath.value !=
                                      ""
                                  ? Image.file(
                                      File(updateProfileController
                                          .selectedImagePath.value),
                                      scale: 2.8,
                                      fit: BoxFit.fill,
                                    )
                                  : ImagesWidgets.profileUpdateImage,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 5.w,
                          child: InkWell(
                            onTap: () => imageBottomSheet(context),
                            child: Container(
                              width: 13.w,
                              height: 13.h,
                              decoration:
                                  DecorationUtils.profileEditDecoration(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  UpdateTextField(
                    input: "[A-z]",
                    keyboard: TextInputType.name,
                    typeText: VariableUtils.firstNameText,
                    validate: updateProfileController.validateFirstName,
                    controller: updateProfileController.firstNameController,
                  ),
                  UpdateTextField(
                    input: "[A-z]",
                    keyboard: TextInputType.name,
                    typeText: VariableUtils.lastNameNameText,
                    validate: updateProfileController.validateLastName,
                    controller: updateProfileController.lastNameController,
                  ),
                  UpdateTextField(
                    input: "[A-z@.]",
                    keyboard: TextInputType.emailAddress,
                    typeText: VariableUtils.emailAddressText,
                    validate: updateProfileController.validateEmail,
                    controller: updateProfileController.emailController,
                  ),
                  contactFormField(
                    TextInputType.number,
                    VariableUtils.mobileNumberText,
                    updateProfileController.contactController,
                  ),
                  dateOfBirth(VariableUtils.dateOfBirthText),
                  UpdateTextField(
                    input: "[^ ]",
                    typeText: VariableUtils.address1Text,
                    keyboard: TextInputType.streetAddress,
                    validate: updateProfileController.validateAddress1,
                    controller: updateProfileController.address1Controller,
                  ),
                  UpdateTextField(
                    input: "[^ ]",
                    keyboard: TextInputType.streetAddress,
                    typeText: VariableUtils.address2Text,
                    validate: updateProfileController.validateAddress2,
                    controller: updateProfileController.address2Controller,
                  ),
                  UpdateTextField(
                    input: "[A-z]",
                    typeText: VariableUtils.cityText,
                    keyboard: TextInputType.streetAddress,
                    validate: updateProfileController.validateCity,
                    controller: updateProfileController.cityController,
                  ),
                  UpdateTextField(
                    input: "[A-z]",
                    typeText: VariableUtils.stateText,
                    keyboard: TextInputType.streetAddress,
                    validate: updateProfileController.validateState,
                    controller: updateProfileController.stateController,
                  ),
                  UpdateTextField(
                    input: "[A-z]",
                    keyboard: TextInputType.streetAddress,
                    typeText: VariableUtils.countryText,
                    validate: updateProfileController.validateCountry,
                    controller: updateProfileController.countryController,
                  ),
                  SizeConfig.sH2,
                  CustomBtn(
                    onTap: () {
                      if (profileFormKey.currentState!.validate()) {
                        profileFormKey.currentState!.save();
                        updateProfileController.checkProfile(context);
                      }
                    },
                    height: 7.h,
                    title: VariableUtils.updateText,
                    bgColor: ColorUtils.primaryColor,
                    style: FontTextStyle.buttonTitleStyle,
                  ),
                  SizeConfig.sH2,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  selectdate() async {
    final DateTime? pick = await showDatePicker(
      context: context,
      initialDate: updateProfileController.dt,
      firstDate: DateTime(1800),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDatePickerMode: DatePickerMode.day,
      cancelText: VariableUtils.cancelLowerCaseText,
      confirmText: VariableUtils.ok,
      errorFormatText: VariableUtils.error,
      errorInvalidText: VariableUtils.wrong,
      fieldHintText: VariableUtils.selectDate,
      fieldLabelText: VariableUtils.enterDateText,
    );
    if (pick != null && pick != updateProfileController.dt) {
      updateProfileController.dateOfBirthController.text =
          pick.toString().split(" ")[0];
    }
  }

  imageBottomSheet(context) async {
    Get.bottomSheet(
      Container(
        height: 15.h,
        color: ColorUtils.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCircle(
                IconUtils.camera, VariableUtils.cameraText, ImageSource.camera),
            _buildCircle(IconUtils.galary, VariableUtils.galaryText,
                ImageSource.gallery),
          ],
        ),
      ),
    );
  }

  Widget _buildCircle(icon, text, type) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => updateProfileController.imageCamera(context, type),
          child: Container(
            width: 20.w,
            height: 10.h,
            decoration: DecorationUtils.cameraProfileDecoration(),
            child: icon,
          ),
        ),
        Text(
          text,
          style: FontTextStyle.cameraStyle,
        ),
      ],
    );
  }

  Widget contactFormField(keyboard, typeText, controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizeConfig.sH3,
        Text(
          typeText,
          style: FontTextStyle.emailAddresStyle,
        ),
        SizeConfig.sH05,
        IntlPhoneField(
          controller: controller,
          keyboardType: keyboard,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
          decoration: InputDecoration(
            counterText: '',
            contentPadding: EdgeInsets.all(3.w),
            errorStyle: TextStyle(fontSize: 10.sp),
            focusedBorder: const OutlineInputBorder(),
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget dateOfBirth(typeText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizeConfig.sH3,
        Text(
          typeText,
          style: FontTextStyle.emailAddresStyle,
        ),
        SizeConfig.sH05,
        TextFormField(
          readOnly: true,
          controller: updateProfileController.dateOfBirthController,
          validator: (v) => updateProfileController.validateDob(v),
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () => selectdate(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                  vertical: 1.4.h,
                ),
                child: SizedBox(
                  height: 2.h,
                  width: 2.w,
                  child: ImagesWidgets.profileCalenderImage,
                ),
              ),
            ),
            contentPadding: EdgeInsets.all(3.w),
            errorStyle: TextStyle(fontSize: 11.sp),
            focusedBorder: const OutlineInputBorder(),
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
