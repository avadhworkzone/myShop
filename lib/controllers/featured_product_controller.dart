import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import '../utils/color_utils.dart';

class FeaturedProductController extends GetxController {
  List<Icon> likeUnlike = [];
  RxBool selected = RxBool(false);

  slectedindex(slectedvalue) {
    selected.value = slectedvalue;
  }

  likeChange(index) {
    if (likeUnlike[index].icon == (Icons.favorite_border)) {
      likeUnlike[index] = Icon(
        (Icons.favorite),
        size: 6.w,
        color: ColorUtils.red42,
      );
    } else {
      likeUnlike[index] = Icon(
        (Icons.favorite_border),
        size: 6.w,
        color: ColorUtils.white,
      );
    }
  }
}
