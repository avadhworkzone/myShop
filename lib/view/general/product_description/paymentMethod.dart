// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/variable_utils.dart';
import '../../../utils/font_style_utils.dart';
import '../../../commanWidget/custom_btn.dart';
import '../../../utils/assets/icons_utils.dart';
import '../../../utils/assets/images_utils.dart';
import '../../../commanWidget/common_appbar.dart';
import '../../../controllers/payment_controller.dart';
import '../bottombar_screens/more/review_and_rating.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(15.w),
        child: commonAppbar(leadingIcon: IconUtils.backArrrow, onTap: () {
          /// Leading Icon OnTap
          Get.back();
        },appbarTitle:  VariableUtils.checkOutText, centerTitle: false),
      ),
      backgroundColor: ColorUtils.greyFC,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: VariableUtils.paymentList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => InkWell(
                          splashColor: ColorUtils.transparent,
                          highlightColor: ColorUtils.transparent,
                          onTap: () {
                            paymentController.paymentChange(
                              (index + 1).toString(),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(0.5.h),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Image.asset(
                                    ImagesWidgets.paymentImageList[index],
                                    scale: 0.3.h,
                                  ),
                                  title: Text(
                                    VariableUtils.paymentList[index],
                                  ),
                                  trailing: Theme(
                                    data: ThemeData(
                                      accentColor: ColorUtils.primaryColor,
                                    ),
                                    child: Radio<dynamic>(
                                      value: radioKey[index],
                                      groupValue:
                                          paymentController.selectMethod.value,
                                      onChanged: (val) {
                                        paymentController.paymentChange(val);
                                      },
                                    ),
                                  ),
                                ),
                                (index + 1) == radioKey.length
                                    ? const SizedBox()
                                    : Container(
                                        height: 0.2.h,
                                        color: ColorUtils.greyE1,
                                      )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Container(
              color: ColorUtils.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cirtificate(
                    ImagesWidgets.creditCirtificateImage,
                    VariableUtils.authenticateProductText,
                  ),
                  cirtificate(
                    ImagesWidgets.checkCirtificateImage,
                    VariableUtils.securedPaymentText,
                  ),
                  cirtificate(
                    ImagesWidgets.checkCirtificateImage,
                    // ImagesWidgets.productCirtificate,
                    VariableUtils.easyReturnsText,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 10.h,
            color: ColorUtils.white,
            alignment: Alignment.center,
            child: ListTile(
              title: const Text(VariableUtils.subTotalDeliveryText),
              subtitle: Text(
                VariableUtils.amountDeliveryText,
                style: FontTextStyle.amountStyle,
              ),
              trailing: CustomBtn(
                onTap: () {
                  Get.to(() => RateReviewScreen());
                },
                width: 45.w,
                radius: 2.w,
                style: FontTextStyle.buttonTitleStyle,
                title: VariableUtils.continueText,
                bgColor: ColorUtils.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  PaymentController paymentController = Get.put(PaymentController());

  List radioKey = ["1", "2", "3", "4", "5", "6"];

  Widget cirtificate(img, text) {
    return SizedBox(
      width: 30.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          img,
          Text(
            text,
            style: FontTextStyle.cirtificateStyle,
          ),
        ],
      ),
    );
  }
}
