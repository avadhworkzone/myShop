/// KEY : customBtn
/// Desc. : Add Custom Button
// ignore_for_file: prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../utils/color_utils.dart';
import '../utils/typedef_utils.dart' as tpdf;

class CustomBtn extends StatelessWidget {
  final tpdf.OnTab? onTap;
  final String? title;
  final double? radius;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? bgColor;
  final borderColor;
  final TextStyle? style;

  // ignore: prefer_const_constructors_in_immutables
  CustomBtn({
    required this.onTap,
    required this.title,
    this.radius,
    this.borderColor,
    this.height,
    this.width,
    this.fontSize,
    this.bgColor,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Ink(
        height: height ?? 6.2.h,
        width: width ?? Get.width,
        decoration: bgColor != null
            ? BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(radius ?? 10),
              )
            : BoxDecoration(
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(radius ?? 10),
              ),
        child: InkWell(
          hoverColor: ColorUtils.transparent,
          highlightColor: ColorUtils.transparent,
          splashColor: ColorUtils.transparent,
          onTap: onTap,
          borderRadius: BorderRadius.circular(radius ?? 10),
          child: Center(
            child: Text(
              title!,
              style: style,
            ),
          ),
        ),
      ),
    );
  }
}
