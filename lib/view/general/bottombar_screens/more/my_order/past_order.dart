import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/color_utils.dart';
import '../../../../../utils/variable_utils.dart';
import '../../../../../utils/font_style_utils.dart';
import '../../../../../utils/decoration_utils.dart';
import '../../../../../commanWidget/custom_btn.dart';
import '../../../../../utils/size_config_utils.dart';
import '../../../../../utils/assets/images_utils.dart';

class PostOrder extends StatefulWidget {
  const PostOrder({Key? key}) : super(key: key);

  @override
  State<PostOrder> createState() => _PostOrderState();
}

class _PostOrderState extends State<PostOrder> {
  PostOrderController postOrderController = Get.put(PostOrderController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => postOrderController.viewdetailschek.value == false
          ? SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: ColorUtils.lightWhiteBlueFF,
                        child: Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Column(
                            children: [
                              Text(
                                "${VariableUtils.placedOnText} Wed, 30 June 01:50 PM",
                                style: FontTextStyle.placeOnPostStyle,
                                textAlign: TextAlign.center,
                              ),
                              SizeConfig.sH1,
                              Text(
                                "${VariableUtils.scheduledForText} Sat 3 July 8 PM -11 PM",
                                style: FontTextStyle.placeOnPostStyle,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 1.5.h),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconsWidgets.shoppingCartIconImage,
                              SizeConfig.sW3,
                              Text(
                                VariableUtils.deliveredByMyShopText,
                                style: FontTextStyle.placeOnPostStyle,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(13.sp),
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorUtils.lightWhiteBlueFF,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.sp),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.sp),
                                child: ImagesWidgets.clothesImage,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.sp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 1.h),
                                      Text(
                                        "Dark Brown Jacket",
                                        style: FontTextStyle
                                            .imageTitleDeliveryStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 1.h),
                                      Row(
                                        children: [
                                          Text(
                                            "\$190 X 1",
                                            style: TextStyle(
                                              fontSize: 11.sp,
                                              color: ColorUtils.grey85,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const Spacer(),
                                          Text(
                                            "\$399.00",
                                            style: FontTextStyle.amtStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                      SizeConfig.sH1,
                                      Row(
                                        children: [
                                          Text(
                                            VariableUtils.deliveredChargesText,
                                            style: FontTextStyle
                                                .deliveryChargeStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                          const Spacer(),
                                          Text(
                                            "\$5.49",
                                            style: FontTextStyle
                                                .deliveryChargeStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                      SizeConfig.sH1,
                                      Text(
                                        "${VariableUtils.orderIdText}: ORDER10277526",
                                        style:
                                            FontTextStyle.deliveryChargeStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizeConfig.sH1,
                                      Row(
                                        children: [
                                          IconsWidgets.diliverTickIconImage,
                                          SizedBox(width: 1.w),
                                          Text(
                                            VariableUtils.deliveredText,
                                            style: FontTextStyle
                                                .addressPostStyle
                                                .copyWith(
                                                    color: ColorUtils.pink69),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              VariableUtils.originalAmountText,
                              style: FontTextStyle.deliveryChargeStyle,
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            Text(
                              "\$399",
                              style: FontTextStyle.deliveryChargeStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.w),
                        child: Row(
                          children: [
                            Text(
                              VariableUtils.walletAmountText,
                              style: FontTextStyle.deliveryChargeStyle,
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            Text(
                              "\$399",
                              style: FontTextStyle.deliveryChargeStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.w),
                        child: Row(
                          children: [
                            Text(
                              VariableUtils.finalPaidAmountText,
                              style: FontTextStyle.addressPostStyle
                                  .copyWith(color: ColorUtils.grey8E),
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            Text(
                              "404.45",
                              style: FontTextStyle.addressPostStyle
                                  .copyWith(color: ColorUtils.grey8E),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizeConfig.sH2,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: CustomBtn(
                          onTap: () => postOrderController.pastOrderDetails(),
                          radius: 5,
                          title: VariableUtils.viewDetailsText,
                          bgColor: ColorUtils.primaryColor,
                          style: FontTextStyle.buttonTitleStyle
                              .copyWith(fontSize: 13.sp),
                        ),
                      ),
                      SizeConfig.sH3,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: CustomBtn(
                          onTap: () {},
                          radius: 5,
                          title: VariableUtils.reOrderText,
                          bgColor: ColorUtils.pink69,
                          style: FontTextStyle.buttonTitleStyle
                              .copyWith(fontSize: 13.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : SafeArea(
              child: Scaffold(
                backgroundColor: ColorUtils.lightWhiteBlueFF,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(14.sp),
                        child: Text(
                          "${VariableUtils.placeOnText} Wed, 30 June 01:50 PM",
                          style: FontTextStyle.addressPostStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        color: ColorUtils.green25,
                        child: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconsWidgets.orderSuccessIconImage,
                              SizeConfig.sW2,
                              Text(
                                VariableUtils.yayOrderSuccessfullyDeliveredText,
                                style: FontTextStyle.delivedSuccessStyle,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: ColorUtils.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.2.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.sp),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            VariableUtils.deliveredOnText,
                                            style:
                                                FontTextStyle.deliverdOnStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            "Sat 3, Aug 8:13 AM",
                                            textAlign: TextAlign.center,
                                            style:
                                                FontTextStyle.deliverdOnStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomBtn(
                                          onTap: () {},
                                          title: VariableUtils.changeText,
                                          bgColor: ColorUtils.pink69,
                                          radius: 1.w,
                                          width: 32.w,
                                          height: 11.w,
                                          style: FontTextStyle.buttonTitleStyle
                                              .copyWith(fontSize: 11.sp),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizeConfig.sH1,
                              Row(
                                children: [
                                  SizeConfig.sW2,
                                  IconsWidgets.payOnlineIconImage,
                                  SizeConfig.sW2,
                                  Text(
                                    VariableUtils.payOnlineText,
                                    style: FontTextStyle.payOnlineStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              SizeConfig.sH1,
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(4.w, 4.w, 4.w, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "1 ${VariableUtils.itemsText}",
                              textAlign: TextAlign.center,
                              style: FontTextStyle.itemsStyle,
                            ),
                            Text(
                              "${VariableUtils.amountText} \$399.00",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: ColorUtils.black22,
                                fontWeight: FontWeight.w800,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.w),
                        child: Container(
                          decoration: DecorationUtils.boxDecoration(),
                          child: Padding(
                            padding: EdgeInsets.all(3.w),
                            child: Row(
                              children: [
                                Container(
                                  height: 24.w,
                                  width: 24.w,
                                  decoration: DecorationUtils
                                      .checkoutImageDeliveryDecoration(),
                                  child: Padding(
                                    padding: EdgeInsets.all(2.w),
                                    child: ImagesWidgets.clothesImage,
                                  ),
                                ),
                                SizeConfig.sW5,
                                SizedBox(
                                  height: 28.w,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(),
                                      Text(
                                        VariableUtils.darkBrownJacketText,
                                        style: FontTextStyle
                                            .imageTitleDeliveryStyle
                                            .copyWith(fontSize: 12.sp),
                                      ),
                                      Text(
                                        VariableUtils
                                            .imageAmountCountDeliveryText,
                                        style: FontTextStyle.imageAmountStyle
                                            .copyWith(fontSize: 11.sp),
                                      ),
                                      Text(
                                        VariableUtils.amountDeliveryText,
                                        style: FontTextStyle
                                            .imageTitleDeliveryStyle
                                            .copyWith(fontSize: 11.sp),
                                      ),
                                      const SizedBox(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizeConfig.sH2,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: CustomBtn(
                          onTap: () {},
                          radius: 5,
                          title: VariableUtils.customerSupportText,
                          bgColor: ColorUtils.primaryColor,
                          style: FontTextStyle.buttonTitleStyle
                              .copyWith(fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class PostOrderController extends GetxController {
  RxBool viewdetailschek = RxBool(false);

  pastOrderDetails() {
    viewdetailschek.value = !viewdetailschek.value;
  }
}
