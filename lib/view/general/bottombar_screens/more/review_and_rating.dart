import 'edit_review.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/variable_utils.dart';
import '../../../../utils/font_style_utils.dart';
import '../../../../utils/size_config_utils.dart';
import '../../../../commanWidget/custom_btn.dart';
import '../../../../utils/assets/icons_utils.dart';
import '../../../../commanWidget/common_ratting.dart';
import '../../../../commanWidget/common_textFormField.dart';
import '../../../../controllers/rate_raview_controller.dart';

class RateReviewScreen extends StatefulWidget {
  RateReviewScreen({Key? key}) : super(key: key);

  @override
  State<RateReviewScreen> createState() => _RateReviewScreenState();
}

class _RateReviewScreenState extends State<RateReviewScreen> {
  double rating = 0.0;
  RateReviewController rateReviewController = RateReviewController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 7.w, left: 4.w),
            height: 24.w,
            width: double.infinity,
            color: ColorUtils.primaryColor,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: IconUtils.backArrrow,
                ),
                SizeConfig.sW4,
                Text(
                  VariableUtils.reviewRatingsText,
                  style: FontTextStyle.appbartitleTextStyle,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizeConfig.sH4,
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
                        rattingChange: rateReviewController.ratingChange,
                        ratting: rateReviewController.rateReview.value,
                      ),
                    ),
                  ),
                  SizeConfig.sH3,
                  Text(
                    VariableUtils.rateYourExperienceText,
                    style: FontTextStyle.rateYourExperienceStyle,
                  ),
                  SizeConfig.sH3,
                  Form(
                    key: rateReviewController.rateFormKey,
                    child: ReviewTextField(
                      hintText: VariableUtils.hintWriteYourExperienceText,
                      controller: rateReviewController.reviewController,
                    ),
                  ),
                  SizeConfig.sH3,
                  CustomBtn(
                    onTap: () {
                      Get.to(
                        () => const EditReview(),
                        arguments: [
                          rateReviewController.rateReview.value,
                          rateReviewController.reviewController.text,
                        ],
                      );
                    },
                    bgColor: ColorUtils.primaryColor,
                    height: 16.w,
                    radius: 7.0,
                    style: FontTextStyle.buttonTextColor,
                    width: 90.w,
                    title: VariableUtils.submitText,
                  ),
                  SizeConfig.sH2,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
