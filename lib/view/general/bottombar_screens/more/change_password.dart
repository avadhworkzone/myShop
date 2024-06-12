// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:my_shop/commanWidget/custom_snackbar.dart';
import 'package:my_shop/modal/apiModel/request_model/change_password_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/change_password_res_model.dart';
import 'package:my_shop/modal/apis/api_response.dart';
import 'package:my_shop/utils/shared_preference_utils.dart';
import 'package:my_shop/view/general/bottombar_screens/more/setting_screen.dart';
import 'package:my_shop/viewModel/auth_viewmodel.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/variable_utils.dart';
import '../../../../utils/font_style_utils.dart';
import '../../../../utils/size_config_utils.dart';
import '../../../../commanWidget/custom_btn.dart';
import '../../../../utils/assets/icons_utils.dart';
import '../../../../utils/assets/images_utils.dart';
import '../../../../commanWidget/common_appbar.dart';
import '../../../../controllers/changePassword_controller.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  ChangePasswordReqModel changePasswordReqModel = ChangePasswordReqModel();
  AuthViewModel authViewModel = Get.find();
  CustomSnackbar snackbar = CustomSnackbar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(15.w),
        child: commonAppbar(leadingIcon: IconUtils.backArrrow, onTap: () {
          /// Leading Icon OnTap
          Get.back();
        }, appbarTitle: VariableUtils.changePasswordText, centerTitle: false),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: changePasswordFormKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Obx(
                    () => Column(
                      children: [
                        commonFormPassword(
                          VariableUtils.currentPasswordText,
                          changePasswordController.currentController,
                          TextInputType.visiblePassword,
                          changePasswordController
                                      .currentPasswordVisible.value ==
                                  false
                              ? ImagesWidgets.visiblityOffImage
                              : ImagesWidgets.visiblityImage,
                          changePasswordController
                                      .currentPasswordVisible.value ==
                                  false
                              ? true
                              : false,
                          changePasswordController.validateCurrent,
                        ),
                        commonFormPassword(
                          VariableUtils.newPasswordText,
                          changePasswordController.newController,
                          TextInputType.visiblePassword,
                          changePasswordController.newPasswordVisible.value ==
                                  false
                              ? ImagesWidgets.visiblityOffImage
                              : ImagesWidgets.visiblityImage,
                          changePasswordController.newPasswordVisible.value ==
                                  false
                              ? true
                              : false,
                          changePasswordController.validatePassword,
                        ),
                        commonFormPassword(
                          VariableUtils.confirmPasswordText,
                          changePasswordController.confirmController,
                          TextInputType.visiblePassword,
                          changePasswordController
                                      .confirmPasswordVisible.value ==
                                  false
                              ? ImagesWidgets.visiblityOffImage
                              : ImagesWidgets.visiblityImage,
                          changePasswordController
                                      .confirmPasswordVisible.value ==
                                  false
                              ? true
                              : false,
                          changePasswordController.validatePassword,
                        ),
                        SizeConfig.sH2,
                        CustomBtn(
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                            if (changePasswordFormKey.currentState!
                                .validate()) {
                              changePasswordController.checkProfile(context);
                              changePasswordFormKey.currentState!.save();
                              changePasswordReqModel.currentPassword =
                                  changePasswordController
                                      .currentController.text;
                              changePasswordReqModel.newPassword =
                                  changePasswordController.newController.text;
                              changePasswordReqModel.userId =
                                  PreferenceUtils.getUserId();
                              await authViewModel.changePasswordViewModel(
                                  changePasswordReqModel);
                              if (authViewModel
                                      .changePasswordApiResponse.status ==
                                  Status.COMPLETE) {
                                ChangePasswordResModel response = authViewModel
                                    .changePasswordApiResponse.data;
                                if (response.status == "OK") {
                                  snackbar.customSnackBar(
                                    context,
                                    '${response.message}',
                                    ColorUtils.primaryColor,
                                  );
                                  Future.delayed(
                                    Duration(seconds: 2),
                                    () {
                                      Get.to(() => SettingScreen());
                                    },
                                  );
                                  return;
                                }
                              }
                            }
                          },
                          height: 7.h,
                          title: VariableUtils.updateText,
                          bgColor: ColorUtils.primaryColor,
                          style: FontTextStyle.buttonTitleStyle,
                        ),
                        SizeConfig.sH2,
                        CustomBtn(
                          onTap: () => Get.back(),
                          height: 7.h,
                          title: VariableUtils.cancelUpperCaseText,
                          bgColor: ColorUtils.greyB8,
                          style: FontTextStyle.buttonTitleStyle,
                        ),
                        SizeConfig.sH2,
                        GetBuilder<AuthViewModel>(
                          builder: (changePasswordController) {
                            if (authViewModel
                                    .changePasswordApiResponse.status ==
                                Status.LOADING) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            return const SizedBox();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final changePasswordFormKey = GlobalKey<FormState>();
  Widget commonFormPassword(
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
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[^ ]"))],
          controller: controller,
          keyboardType: keyboard,
          validator: (v) => validate(v),
          obscureText: obscured,
          obscuringCharacter: "*",
          cursorColor: ColorUtils.grey6F,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(3.w),
            errorStyle: TextStyle(fontSize: 11.sp),
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 3.w,
                vertical: 1.4.h,
              ),
              child: InkWell(
                highlightColor: ColorUtils.transparent,
                splashColor: ColorUtils.transparent,
                onTap: () {
                  typeText == VariableUtils.currentPasswordText
                      ? changePasswordController.passwordVisible1()
                      : typeText == VariableUtils.newPasswordText
                          ? changePasswordController.passwordVisible2()
                          : changePasswordController.passwordVisible3();
                },
                child: Image.asset(
                  icon,
                  color: ColorUtils.grey6F,
                  fit: BoxFit.fill,
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

  ChangePasswordController changePasswordController =
      Get.put(ChangePasswordController());
}
