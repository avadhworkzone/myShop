// ignore_for_file: prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'dart:developer';

import 'package:my_shop/modal/apiModel/request_model/login_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/logout_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/logout_res_model.dart';

import '../../../../commanWidget/common_appbar.dart';
import '../../../../commanWidget/custom_snackbar.dart';
import '../../../../modal/apiModel/response_model/login_res_model.dart';
import '../../../../modal/apis/api_response.dart';
import '../../../../viewModel/auth_viewmodel.dart';
import 'change_password.dart';
import 'language_change.dart';
import 'package:get/get.dart';
import 'my_order/my_order.dart';
import 'review_and_rating.dart';
import 'package:sizer/sizer.dart';
import '../bottombar_screen.dart';
import 'terms_and_conditions.dart';
import '../../../login/signIn.dart';
import 'package:flutter/material.dart';
import '../profile/profile_screen.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/typedef_utils.dart';
import '../../../../utils/variable_utils.dart';
import '../../../../utils/font_style_utils.dart';
import '../../../../utils/assets/icons_utils.dart';
import '../../../../utils/shared_preference_utils.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key,this.isBottomNavigation}) : super(key: key);

  bool? isBottomNavigation;
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  AuthViewModel authViewModel = Get.find();

  LogOutReqModel logOutReqModel = LogOutReqModel();
  CustomSnackbar snackbar = CustomSnackbar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.lightWhiteBlueFF,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(15.w),
        child: widget.isBottomNavigation==true?commonAppbar(appbarTitle: VariableUtils.settingsText,centerTitle: false,leadingWidth: 0):commonAppbar(leadingIcon: IconUtils.backArrrow,onTap: () {
          /// Leading Icon OnTap
          Get.arguments == 'settingScrBack'
              ? Get.back()
              : Get.offAll(
            BottomScreen(),
            arguments: 'bottomProfileScreen',
          );
        }, appbarTitle: VariableUtils.settingsText, centerTitle: false),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PreferenceUtils.getUserId().isNotEmpty
                      ? Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.all(5.w),
                                child: Text(
                                  VariableUtils.accountText,
                                  style: FontTextStyle.accountStyle,
                                ),
                              ),
                            ),
                            comonListTile(
                              VariableUtils.profilesText,
                              () {
                                Get.to(
                                  () => const ProfileScreen(),
                                  arguments: 'settingScrProfileBack',
                                );
                              },
                              0.3.w,
                            ),
                            comonListTile(
                              VariableUtils.changePasswordText,
                              () {
                                Get.to(
                                  () => const ChangePassword(),
                                  arguments: 'settingScrChangePasswordBack',
                                );
                              },
                              0.3.w,
                            ),
                            comonListTile(
                              VariableUtils.changeLanguageText,
                              () {
                                Get.to(() => const ChangeLanguageScreen());
                              },
                              0.3.w,
                            ),
                            comonListTile(
                              VariableUtils.myOrdersText,
                              () {
                                Get.to(() => const MyOrder());
                              },
                              0.3.w,
                            ),
                            comonListTile(
                              VariableUtils.reviewsText,
                              () {
                                Get.to(() => RateReviewScreen());
                              },
                              0.0.w,
                            ),
                          ],
                        )
                      : SizedBox(),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(5.w),
                      child: Text(
                        VariableUtils.othersText,
                        style: FontTextStyle.accountStyle,
                      ),
                    ),
                  ),
                  comonListTile(VariableUtils.privacyPolicyText, () {
                    Get.to(() => const TermsConditions());
                  }, 0.3.w),
                  comonListTile(VariableUtils.termsAndConditions, () {
                    Get.to(() => const TermsConditions());
                  }, 0.3.w),
                  // SizeConfig.sHW11,
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.white,
            width: double.infinity,
            height: 20.w,
            child: InkWell(
              onTap: () {
                PreferenceUtils.getUserId().isEmpty
                    ? Get.to(() => SignIn())
                    : Get.dialog(
                        barrierDismissible: true,
                        useSafeArea: true,
                        AlertDialog(
                          titlePadding: EdgeInsets.zero,
                          contentPadding: EdgeInsets.zero,
                          insetPadding: EdgeInsets.zero,
                          actions: [
                            Container(
                              color: ColorUtils.greyCB,
                              height: 0.2.w,
                              width: double.infinity,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  highlightColor: ColorUtils.transparent,
                                  splashColor: ColorUtils.transparent,
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 20.w,
                                    width: 35.w,
                                    child: Text(
                                      VariableUtils.noText,
                                      style: TextStyle(
                                        color: ColorUtils.lightgreyBA,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeightClass.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: ColorUtils.greyCB,
                                  height: 20.w,
                                  width: 0.2.w,
                                ),
                                InkWell(
                                  highlightColor: ColorUtils.transparent,
                                  splashColor: ColorUtils.transparent,
                                  onTap: () async {
                                    logOutReqModel.userId =
                                        PreferenceUtils.getUserId();

                                    await authViewModel
                                        .logOutViewModel(logOutReqModel);
                                    if (authViewModel
                                            .logOutApiResponse.status ==
                                        Status.COMPLETE) {
                                      LogOutResModel LogOutresponse =
                                          authViewModel.logOutApiResponse.data;
                                      if (LogOutresponse.status!.isEmpty) {
                                        snackbar.customSnackBar(
                                          context,
                                          '${LogOutresponse.status}',
                                          ColorUtils.primaryColor,
                                        );
                                        return;
                                      }
                                      PreferenceUtils.clearPreference();
                                      PreferenceUtils.setLogin(0);
                                      Future.delayed(
                                        const Duration(seconds: 1),
                                        () {
                                          Get.offAll(() => SignIn());
                                        },
                                      );
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 20.w,
                                    width: 35.w,
                                    child: Text(
                                      VariableUtils.yesText,
                                      style: TextStyle(
                                        color: ColorUtils.primaryColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeightClass.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                          content: Container(
                            height: 17.h,
                            width: 80.w,
                            alignment: Alignment.center,
                            child: Text(
                              'Are you sure you want to \n logout?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: ColorUtils.blue68,
                                fontWeight: FontWeightClass.medium,
                              ),
                            ),
                          ),
                        ),
                      );
              },
              child: Text(
                PreferenceUtils.getUserId().isEmpty
                    ? VariableUtils.logIn
                    : VariableUtils.logoutText,
                style: TextStyle(
                    color: ColorUtils.primaryColor,
                    fontWeight: FontWeightClass.bold,
                    fontSize: 12.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }

  comonListTile(titletext, OnTab Ontap, dividerHeight) {
    return Container(
      color: ColorUtils.white,
      child: InkWell(
        onTap: Ontap,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(2.w),
              child: ListTile(
                title: Text(
                  titletext,
                  style: const TextStyle(
                      color: ColorUtils.blue68,
                      fontWeight: FontWeightClass.medium),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 12.sp,
                  color: ColorUtils.blackB0,
                ),
              ),
            ),
            Container(
              color: ColorUtils.lightWhiteBlueFF,
              height: dividerHeight,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
