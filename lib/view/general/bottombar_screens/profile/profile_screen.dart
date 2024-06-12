import 'package:get/get.dart';
import 'update_profile.dart';
import 'package:sizer/sizer.dart';
import '../bottombar_screen.dart';
import 'package:flutter/material.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/variable_utils.dart';
import '../../../../utils/size_config_utils.dart';
import '../../../../utils/assets/images_utils.dart';
import '../../../../utils/assets/icons_utils.dart';
import '../../../../controllers/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.lightWhiteBlueFF,
      appBar: AppBar(
        leading: InkWell(
          highlightColor: ColorUtils.transparent,
          splashColor: ColorUtils.transparent,
          onTap: () {
            Get.arguments == 'settingScrProfileBack'
                ? Get.back()
                : Get.offAll(BottomScreen(), arguments: 'bottomProfileScreen');
          },
          child: IconUtils.backArrow,
        ),
        elevation: 1.0,
        title: const Text(VariableUtils.profileText),
        backgroundColor: ColorUtils.primaryColor,
        actions: [
          InkWell(
            highlightColor: ColorUtils.transparent,
            splashColor: ColorUtils.transparent,
            onTap: () {
              Get.to(() => const UpdateProfileScreen());
            },
            child: Padding(
              padding: EdgeInsets.only(top: 1.w, right: 2.w),
              child: IconsWidgets.editIconImage,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 30.w,
              width: 100.w,
              color: ColorUtils.white,
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: Row(
                  children: [
                    ImagesWidgets.editProductImage,
                    SizeConfig.sW4,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Hello,'),
                        Text(
                          'Zack Postar',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: ColorUtils.grey73,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizeConfig.sH2,
            editFormField(
              VariableUtils.address1Text,
              profileController.addressController,
            ),
            editFormField(
              VariableUtils.emailAddressText,
              profileController.emailController,
            ),
            editFormField(
              VariableUtils.mobileNumberText,
              profileController.contactController,
            ),
            editFormField(
              VariableUtils.genderText,
              profileController.genderController,
            ),
            editFormField(
              VariableUtils.dateOfBirthText,
              profileController.dateOfBirthController,
            ),
            Container(
              width: 100.w,
              color: ColorUtils.white,
              padding: EdgeInsets.all(2.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              VariableUtils.manageSaveCardText,
                              style: TextStyle(
                                color: ColorUtils.greyB8,
                                fontSize: 10.sp,
                              ),
                            ),
                            const Text(
                              VariableUtils.editText,
                              style: TextStyle(
                                color: ColorUtils.pink69,
                              ),
                            ),
                          ],
                        ),
                        SizeConfig.sH1,
                        Text(
                          'ICICI Bank Credit Card',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: ColorUtils.grey8E,
                          ),
                        ),
                        SizeConfig.sH1,
                        Text(
                          VariableUtils.visaSubtitleText,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: ColorUtils.grey8E,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget editFormField(text, controller) {
    return Container(
      width: 100.w,
      color: ColorUtils.white,
      padding: EdgeInsets.all(2.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Text(
              text,
              style: TextStyle(color: ColorUtils.greyB8, fontSize: 10.sp),
            ),
          ),
          TextFormField(
            enabled: false,
            controller: controller,
            style: const TextStyle(color: ColorUtils.grey8E),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(3.w),
              errorStyle: TextStyle(fontSize: 8.8.sp),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
          Container(
            height: 0.1.h,
            color: ColorUtils.grey8C,
          )
        ],
      ),
    );
  }

  ProfileController profileController = Get.put(ProfileController());
}
