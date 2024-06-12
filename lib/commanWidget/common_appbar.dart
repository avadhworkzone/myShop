import 'package:my_shop/utils/assets/images_utils.dart';
import 'package:sizer/sizer.dart';
import '../utils/color_utils.dart';
import '../utils/typedef_utils.dart';
import 'package:flutter/material.dart';

/// TitleText , Action Icon And Leading Icon
Widget appbar(
    {context,
    centertitle,
    title,
    OnTab? onTap,
    actionicon,
    Widget? leadingIcon}) {
  return AppBar(
    elevation: 1.0,
    title: Text(title),
    centerTitle: centertitle,
    leading: leadingIcon,
    leadingWidth: 22.w,
    backgroundColor: ColorUtils.primaryColor,
    actions: [
      InkWell(
        highlightColor: ColorUtils.transparent,
        splashColor: ColorUtils.transparent,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(top: 1.w, right: 2.w),
          child: actionicon,
        ),
      ),
    ],
  );
}

/// Leading Icon and Title Text
Widget commonAppbar({leadingIcon, OnTab? onTap, appbarTitle, centerTitle,double? leadingWidth}) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: ColorUtils.primaryColor,
    leading: InkWell(
      onTap: onTap,
      child: leadingIcon,
    ),
    leadingWidth: leadingWidth,
    title: Text(appbarTitle),
    centerTitle: centerTitle,
  );
}
