import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../nointernet_screen.dart';
import '../../utils/color_utils.dart';
import 'package:flutter/material.dart';
import '../../utils/variable_utils.dart';
import '../../utils/font_style_utils.dart';
import '../../commanWidget/custom_btn.dart';
import '../../utils/size_config_utils.dart';
import '../../utils/assets/icons_utils.dart';
import '../../utils/assets/images_utils.dart';
import '../../commanWidget/common_appbar.dart';
import 'bottombar_screens/bottombar_screen.dart';
import '../../viewModel/connectivity_view_model.dart';
import 'bottombar_screens/more/my_order/my_order.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConnectivityViewModel>(
      builder: (connectivityViewModel) {
        if (connectivityViewModel.isOnline != null) {
          if (connectivityViewModel.isOnline!) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(15.w),
                child: commonAppbar(leadingIcon: IconUtils.backArrrow, onTap: () {
                  /// Leading Icon OnTap
                  Get.back();
                }, appbarTitle: VariableUtils.thanksOrderText, centerTitle: true),
              ),
              body: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: ColorUtils.white,
                    child: Column(
                      children: [
                        SizeConfig.sH7,
                        Text(
                          VariableUtils.forYourOrderText,
                          style: FontTextStyle.forYourOrderStyle,
                        ),
                        SizeConfig.sH2,
                        Text(
                          '${VariableUtils.orderNumber} #SC124535',
                          style: FontTextStyle.orderNumberStyle,
                        ),
                        SizeConfig.sH2,
                        ImagesWidgets.thankYouVectorImage,
                        SizeConfig.sH5,
                        Text(
                          VariableUtils.estimatedDeliveryText,
                          style: FontTextStyle.estimatedDeliveryStyle,
                        ),
                        SizeConfig.sH5,
                        CustomBtn(
                          onTap: () {
                            Get.to(() => const MyOrder());
                          },
                          bgColor: ColorUtils.primaryColor,
                          height: 16.w,
                          radius: 7.0,
                          style: FontTextStyle.buttonTextColor,
                          width: 90.w,
                          title: VariableUtils.trackYourOrderHereText,
                        ),
                        SizeConfig.sH4,
                        CustomBtn(
                          onTap: () {
                            Get.offAll(() => BottomScreen());
                          },
                          bgColor: ColorUtils.grey8E,
                          height: 16.w,
                          radius: 7.0,
                          style: FontTextStyle.buttonTextColor,
                          width: 90.w,
                          title: VariableUtils.continueShoppingText,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const NoInterNetConnected();
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
