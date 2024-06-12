import 'package:flutter/material.dart';

class CustomSnackbar {
  // customSnackBar(title, message) {
  //   Get.snackbar(
  //     title,
  //     message,
  //     colorText: ColorUtils.white,
  //     snackPosition: SnackPosition.BOTTOM,
  //     backgroundColor: ColorUtils.primaryColor,
  //     margin: EdgeInsets.only(bottom: 2.h, left: 10.w, right: 10.w),
  //   );
  // }

  customSnackBar(context,text,color) {
  final snackbar = SnackBar(
    content: Text(text),
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
    // duration: const Duration(seconds: 5),
    // margin: EdgeInsets.all(5.w),
    
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

}
