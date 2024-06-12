import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../thank_you_screen.dart';
import 'package:flutter/material.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/variable_utils.dart';
import '../../../commanWidget/custom_btn.dart';
import '../../../utils/decoration_utils.dart';
import '../../../utils/font_style_utils.dart';
import '../../../utils/size_config_utils.dart';
import '../../../utils/assets/images_utils.dart';
import '../../../controllers/delivery_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: ColorUtils.white,
                  padding: EdgeInsets.all(4.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                VariableUtils.deliverText,
                                style: FontTextStyle.deliverdStyle,
                              ),
                              Text(
                                VariableUtils.zackPosterText,
                                style: FontTextStyle.deliverdStyle,
                              ),
                            ],
                          ),
                          ImagesWidgets.editDeliveryImage,
                        ],
                      ),
                      Text(
                        VariableUtils.addressText,
                        textAlign: TextAlign.left,
                        style: FontTextStyle.addressDeliveryStyle,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Container(
                    color: ColorUtils.white,
                    padding: EdgeInsets.all(3.w),
                    child: Row(
                      children: [
                        Container(
                          height: 25.w,
                          width: 21.w,
                          decoration:
                              DecorationUtils.checkoutImageDeliveryDecoration(),
                          child: ImagesWidgets.clothesImage,
                        ),
                        SizeConfig.sW5,
                        SizedBox(
                          height: 28.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 60.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      VariableUtils.darkBrownJacketText,
                                      style: FontTextStyle.deliverdStyle,
                                    ),
                                    ImagesWidgets.deleteDeliveryImage,
                                  ],
                                ),
                              ),
                              Text(
                                VariableUtils.imageAmountCountDeliveryText,
                                style: FontTextStyle.imageAmountStyle,
                              ),
                              Obx(
                                () => Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        deliveryController.decrement();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(1.w),
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorUtils.greyB8,
                                        ),
                                        child: Icon(
                                          Icons.remove,
                                          size: 5.w,
                                          color: ColorUtils.white,
                                        ),
                                      ),
                                    ),
                                    SizeConfig.sW3,
                                    Text(
                                      deliveryController.isIncrement.value
                                          .toString(),
                                      style: FontTextStyle.imageCounterStyle,
                                    ),
                                    SizeConfig.sW3,
                                    InkWell(
                                      onTap: () {
                                        deliveryController.increment();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(1.w),
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorUtils.greyB8,
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: 5.w,
                                          color: ColorUtils.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 4.w),
                  child: Container(
                    color: ColorUtils.white,
                    padding: EdgeInsets.all(4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          VariableUtils.voucherText,
                          style: FontTextStyle.enterVoucherCodeStyle,
                        ),
                        SizeConfig.sH1,
                        Container(
                          decoration: DecorationUtils
                              .formDecorationDeliveryDecoration(),
                          child: TextFormField(
                            cursorColor: ColorUtils.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(3.w),
                              hintText: VariableUtils.voucherCodeText,
                              suffixIcon: Container(
                                width: 35.w,
                                decoration: BoxDecoration(
                                  color: ColorUtils.pink69,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(1.2.w),
                                    bottomRight: Radius.circular(1.2.w),
                                  ),
                                  border: Border.all(
                                    color: ColorUtils.grey6D.withOpacity(0.5),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    VariableUtils.applyText,
                                    style: TextStyle(
                                      color: ColorUtils.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              errorStyle: TextStyle(fontSize: 8.8.sp),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorUtils.grey6D.withOpacity(0.5),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorUtils.grey6D.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.w),
                  child: Text(
                    VariableUtils.availlableVoucherText,
                    style: FontTextStyle.voucherDeliveryStyle,
                  ),
                ),
                Obx(
                  () => Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                        child: PageView.builder(
                          itemCount: VariableUtils.sliderImageHomeScreen.length,
                          onPageChanged: (ind) {
                            deliveryController.slide(ind);
                          },
                          itemBuilder: (context, index) {
                            return Container(
                              height: 22.h,
                              padding: EdgeInsets.symmetric(
                                horizontal: 3.w,
                                vertical: 1.w,
                              ),
                              child: Container(
                                padding: EdgeInsets.all(1.4.w),
                                decoration: DecorationUtils
                                    .voucherDecorationDeliveryDecoration(),
                                child:
                                    VariableUtils.sliderImageHomeScreen[index],
                              ),
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          controller: voucherController,
                        ),
                      ),
                      SizeConfig.sH05,
                      AnimatedSmoothIndicator(
                        activeIndex: deliveryController.currentDots.value,
                        // currentIndictorDots,
                        count: VariableUtils.sliderImageProductScreen.length,
                        effect: ExpandingDotsEffect(
                          spacing: 2.w,
                          dotWidth: 5.w,
                          expansionFactor: 1.8,
                          dotHeight: 1.5.w,
                          paintStyle: PaintingStyle.fill,
                          strokeWidth: 4,
                          dotColor: ColorUtils.greyB8,
                          activeDotColor: ColorUtils.yellow20,
                        ),
                      ),
                      SizeConfig.sH2,
                    ],
                  ),
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
              style: FontTextStyle.bottomSubtitleStyle,
            ),
            trailing: CustomBtn(
              onTap: () {
                Get.to(() => const ThankYouScreen());
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
    );
  }

  final PageController voucherController = PageController(initialPage: 0);
  DeliveryController deliveryController = Get.put(DeliveryController());
}
