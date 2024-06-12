// ignore_for_file: file_names

import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_shop/modal/apiModel/response_model/forgot_password_res_model.dart';
import 'package:my_shop/view/login/resetPassword.dart';
import 'package:sizer/sizer.dart';
import '../../commanWidget/custom_snackbar.dart';
import '../../modal/apiModel/request_model/forgot_password_req_model.dart';
import '../../modal/apis/api_response.dart';
import '../../utils/color_utils.dart';
import 'package:flutter/material.dart';
import '../../utils/variable_utils.dart';
import '../../utils/decoration_utils.dart';
import '../../utils/font_style_utils.dart';
import '../../utils/size_config_utils.dart';
import '../../commanWidget/custom_btn.dart';
import '../../utils/assets/images_utils.dart';
import '../../commanWidget/common_textFormField.dart';
import '../../controllers/forgotPassword_controller.dart';
import '../../viewModel/auth_viewmodel.dart';
import '../general/bottombar_screens/more/change_password.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  AuthViewModel authViewModel = Get.find();
  ForgotPasswordReqModel forgotPasswordReqModel = ForgotPasswordReqModel();
  CustomSnackbar snackbar = CustomSnackbar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizeConfig.sH1,
              Container(
                padding: EdgeInsets.fromLTRB(5.w, 5.w, 5.w, 0.w),
                child: Text(
                  VariableUtils.forgotPasswordText,
                  style: FontTextStyle.loginTitleStyle,
                ),
              ),
              SizeConfig.sH2,
              Container(
                height: 40.h,
                width: double.infinity,
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  image: DecorationUtils.forgotPasswordBgDecoration(),
                ),
              ),
              SizeConfig.sH2,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Text(
                  VariableUtils.forgotDescriptionText,
                  style: FontTextStyle.alreadyStyle,
                ),
              ),
              SizeConfig.sH2,
              Form(
                key: forgotPasswordFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonTextField(
                      input: "[A-z@.]",
                      obscured: false,
                      icon: ImagesWidgets.gmailImage,
                      keyboard: TextInputType.emailAddress,
                      typeText: VariableUtils.emailAddressText,
                      validate: forgotPasswordController.validateEmail,
                      controller: forgotPasswordController.emailController,
                    ),
                    SizeConfig.sH4,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: CustomBtn(
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                          if (forgotPasswordFormKey.currentState!.validate()) {
                            // forgotPasswordController.checkForgot();
                            forgotPasswordFormKey.currentState!.save();

                            forgotPasswordReqModel.username =
                                forgotPasswordController.emailController.text;

                            await authViewModel.forgotPasswordViewModel(
                                forgotPasswordReqModel);

                            if (authViewModel
                                    .forgotPasswordApiResponse.status ==
                                Status.COMPLETE) {
                              ForgotPasswordResModel response =
                                  authViewModel.forgotPasswordApiResponse.data;
                              if (response.status == "OK") {
                                Future.delayed(
                                  const Duration(seconds: 4),
                                  () {
                                    Get.off(ResetPassword());
                                  },
                                );
                              }
                              snackbar.customSnackBar(
                                context,
                                '${response.message}',
                                ColorUtils.primaryColor,
                              );
                            }
                          }
                        },
                        height: 7.h,
                        title: VariableUtils.submitText,
                        bgColor: ColorUtils.primaryColor,
                        style: FontTextStyle.buttonTitleStyle,
                      ),
                    ),
                    SizeConfig.sH2,
                  ],
                ),
              ),
              SizeConfig.sH2,
              GetBuilder<AuthViewModel>(
                builder: (authViewModel) {
                  if (authViewModel.forgotPasswordApiResponse.status ==
                      Status.LOADING) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  static final forgotPasswordFormKey = GlobalKey<FormState>();
  ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());

  Widget forgotTextField(
      typeText, controller, keyboard, icon, obscured, validate) {
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
          controller: controller,
          keyboardType: keyboard,
          validator: (v) => validate(v),
          obscureText: obscured,
          obscuringCharacter: "*",
          cursorColor: ColorUtils.grey6F,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(3.w),
            errorStyle: FontTextStyle.errorStyle,
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 3.w,
                vertical: 1.4.h,
              ),
              child: SizedBox(
                height: 2.h,
                width: 2.w,
                child: Image.asset(
                  icon,
                  color: ColorUtils.grey6F,
                  fit: BoxFit.contain,
                  scale: 4.h,
                ),
              ),
            ),
            focusedBorder: const OutlineInputBorder(),
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
