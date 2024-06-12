import 'dart:developer';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/variable_utils.dart';
import '../../../../utils/font_style_utils.dart';
import '../../../../utils/size_config_utils.dart';
import '../../../../commanWidget/custom_btn.dart';
import '../../../../utils/assets/icons_utils.dart';
import '../../../../commanWidget/common_appbar.dart';
import '../../../../commanWidget/common_ratting.dart';
import '../../../../commanWidget/common_textFormField.dart';
import '../../../../controllers/rate_raview_controller.dart';

class EditReview extends StatefulWidget {
  const EditReview({Key? key}) : super(key: key);

  @override
  State<EditReview> createState() => _EditReviewState();
}

class _EditReviewState extends State<EditReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(15.w),
        child: commonAppbar(leadingIcon: IconUtils.backArrrow, onTap: () {
          /// Leading Icon OnTap
          Get.back();
        }, appbarTitle: VariableUtils.editReviewText, centerTitle: false),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(3.w),
                    child: Container(
                      height: 15.w,
                      width: 90.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorUtils.greyB8),
                        borderRadius: BorderRadius.circular(6.w),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(3.w),
                          hintText: VariableUtils.gramercyText,
                          errorStyle: TextStyle(fontSize: 8.8.sp),
                          suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 3.w,
                              vertical: 1.4.h,
                            ),
                            child: SizedBox(
                              height: 2.h,
                              width: 2.w,
                              child: Image.asset(
                                "assets/icons/closeGrey.png",
                                scale: 0.8.w,
                              ),
                            ),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 3.w,
                              vertical: 1.4.h,
                            ),
                            child: SizedBox(
                              height: 2.h,
                              width: 2.w,
                              child: Image.asset(
                                "assets/icons/search.png",
                                scale: 0.8.w,
                              ),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                  SizeConfig.sH2,
                  Card(
                    elevation: 3.0,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          height: 35.w,
                          width: 90.w,
                          decoration: const BoxDecoration(
                            color: ColorUtils.lightWhiteBlueFF,
                            image: DecorationImage(
                              image: AssetImage("assets/images/clothes.png"),
                            ),
                          ),
                          child: Image.asset(
                            "assets/icons/closeRed.png",
                            scale: 0.8.w,
                          ),
                        ),
                        Container(
                          height: 15.w,
                          width: 90.w,
                          color: ColorUtils.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      VariableUtils.gramercyText,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      VariableUtils.addressRateingText,
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        color: ColorUtils.lightgreyBA,
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  "assets/icons/checkGreen.png",
                                  scale: 1.w,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizeConfig.sH4,
                  Text(
                    VariableUtils.ratingText,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorUtils.black55,
                    ),
                  ),
                  SizeConfig.sH2,
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5.w),
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: ColorUtils.lightBlueFF,
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Obx(
                      () => CommonRatting(
                        size: 5.5.h,
                        spaceing: 2.w,
                        rattingChange: rateReviewController.editRatingChange,
                        ratting:
                            rateReviewController.editRateReview.value == 0.0
                                ? Get.arguments[0]
                                : rateReviewController.editRateReview.value,
                      ),
                    ),
                  ),
                  SizeConfig.sH1,
                  Text(
                    VariableUtils.rateYourExperienceText,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorUtils.black55,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      VariableUtils.ratingText,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.grey8E,
                      ),
                    ),
                  ),
                  ReviewTextField(
                    hintText: 'Review',
                    controller: editController,
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.w),
                    child: CustomBtn(
                      onTap: () {},
                      style: FontTextStyle.buttonTitleStyle,
                      title: VariableUtils.updateText,
                      bgColor: ColorUtils.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    editController = TextEditingController(text: Get.arguments[1]);
    log(Get.arguments[1]);
  }

  // double rateReview2 = 0.0;
  RateReviewController rateReviewController = Get.put(RateReviewController());
  var editController = TextEditingController();
}
