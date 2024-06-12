import 'package:my_shop/controllers/bottom_bar_controller.dart';
import 'package:my_shop/viewModel/cart_view_model.dart';
import '../bottombar_screen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/variable_utils.dart';
import '../../../../utils/font_style_utils.dart';
import '../../../../utils/size_config_utils.dart';
import '../../../../commanWidget/custom_btn.dart';
import '../../../../utils/assets/images_utils.dart';

class MyCart extends StatefulWidget {
  MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  BottombarController bottombarController = Get.find();
  CartViewModel cartViewModel = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImagesWidgets.cartVectorImage,
          SizeConfig.sH2,
          Text(
            VariableUtils.yourCartIsEmptyText,
            style: FontTextStyle.yourCartIsEmptyStyle,
          ),
          SizeConfig.sH2,
          Text(
            VariableUtils.cartDiscribtionText,
            textAlign: TextAlign.center,
            style: FontTextStyle.cartDiscriptionStyle,
          ),
          SizeConfig.sH5,
          CustomBtn(
            onTap: () {
              bottombarController.selectedIndex = 0.obs;
              Get.offAll(BottomScreen());
            },
            bgColor: ColorUtils.primaryColor,
            height: 15.w,
            radius: 7.0,
            style: FontTextStyle.buttonTextColor,
            width: 80.w,
            title: VariableUtils.startShoppingText,
          ),
        ],
      ),
    ));
  }
}
