import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/utils/variable_utils.dart';
import '../../utils/color_utils.dart';
import '../../utils/font_style_utils.dart';
import '../../utils/size_config_utils.dart';
import 'utils/assets/images_utils.dart';

class NoInterNetConnected extends StatelessWidget {
  const NoInterNetConnected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorUtils.white,
      child: SafeArea(
        child: SizedBox(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImagesWidgets.noInternetImage,
              SizeConfig.sH3,
              Text(
                VariableUtils.noInternetText,
                style: FontTextStyle.noInternetStyle,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
