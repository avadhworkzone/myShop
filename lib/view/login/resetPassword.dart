import 'package:get/get.dart';
import 'package:my_shop/modal/apiModel/request_model/reset_password_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/reset_password_res_model.dart';
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
import '../../commanWidget/custom_snackbar.dart';
import '../../modal/apis/api_response.dart';
import '../../utils/decoration_utils.dart';
import '../../utils/shared_preference_utils.dart';
import '../../viewModel/auth_viewmodel.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  AuthViewModel authViewModel = Get.find();

  ResetPasswordReqModel resetPasswordReqModel = ResetPasswordReqModel();

  CustomSnackbar snackbar = CustomSnackbar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(15.w),
        child: commonAppbar(leadingIcon: IconUtils.backArrrow, onTap: () {
          /// Leading Icon OnTap
          Get.back();
        }, appbarTitle: VariableUtils.resetPassword, centerTitle: false),
      ),
      body: Column(
        children: [
          SizeConfig.sH2,
          Container(
            height: 80.w,
            width: 85.w,
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              image: DecorationUtils.resetPasswordBgDecoration(),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: resetPasswordFormKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Obx(
                    () => Column(
                      children: [
                        commonFormPassword(
                          VariableUtils.otp,
                          changePasswordController.otpController,
                          TextInputType.visiblePassword,
                          changePasswordController.otpVisible.value == false
                              ? ImagesWidgets.visiblityImage
                              : ImagesWidgets.visiblityOffImage,
                          changePasswordController.otpVisible.value == false
                              ? true
                              : false,
                          changePasswordController.validateOTP,
                        ),
                        commonFormPassword(
                          VariableUtils.newPasswordText,
                          changePasswordController.newController,
                          TextInputType.visiblePassword,
                          changePasswordController.newPasswordVisible.value ==
                                  false
                              ? ImagesWidgets.visiblityImage
                              : ImagesWidgets.visiblityOffImage,
                          changePasswordController.newPasswordVisible.value ==
                                  false
                              ? true
                              : false,
                          changePasswordController.validateCurrent,
                        ),
                        SizeConfig.sH2,
                        CustomBtn(
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                            if (resetPasswordFormKey.currentState!.validate()) {
                              resetPasswordFormKey.currentState!.save();

                              resetPasswordReqModel.userId =
                                  PreferenceUtils.getUserId();

                              resetPasswordReqModel.otp =
                                  changePasswordController.otpController.text;

                              resetPasswordReqModel.newPassword =
                                  changePasswordController.newController.text;

                              await authViewModel.resetPasswordViewModel(
                                  resetPasswordReqModel);

                              if (authViewModel
                                      .resetPasswordApiResponse.status ==
                                  Status.COMPLETE) {
                                ResetPasswordResModel response =
                                    authViewModel.resetPasswordApiResponse.data;
                                // if (response.message!.isEmpty) {
                                snackbar.customSnackBar(
                                  context,
                                  '${response.message}',
                                  ColorUtils.primaryColor,
                                );
                                // Get.showSnackbar(GetSnackBar(
                                //   title: '${response.status}',
                                // )
                                // );

                                // }

                                // Future.delayed(
                                //   const Duration(seconds: 1),
                                //   () {
                                //     Get.off(BottomScreen());
                                //   },
                                // );
                              }
                              changePasswordController.otpController.clear();
                              changePasswordController.newController.clear();
                            }
                          },
                          height: 7.h,
                          title: VariableUtils.resetPassword,
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

  final resetPasswordFormKey = GlobalKey<FormState>();
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
                  typeText == VariableUtils.otp
                      ? changePasswordController.passwordVisible4()
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
