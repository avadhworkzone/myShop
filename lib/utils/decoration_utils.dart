import 'color_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/utils/assets/images_utils.dart';

class DecorationUtils {
  /// Appbar leading icon TextStyle
  static BoxDecoration leadingIconDecoration() {
    return BoxDecoration(
      border: Border.all(color: ColorUtils.white),
      borderRadius: BorderRadius.circular(30.0),
    );
  }

  /// detail_screen Divider1 line
  static Divider dividerline1() {
    return const Divider(
      indent: 50,
      endIndent: 50,
    );
  }

  /// detail_screen Divider2 line
  static Divider dividerline2() {
    return Divider(
      height: 10.w,
      // color: ColorUtils.gray97,
    );
  }

  /// Home Screen ListView decorations
  static BoxDecoration listviewDecoration() {
    return BoxDecoration(
      color: ColorUtils.white,
      borderRadius: BorderRadius.circular(5.0),
    );
  }

  /// foods images decoration
  static BoxDecoration foodsDecoration() {
    return BoxDecoration(
      color: ColorUtils.black,
      image: DecorationImage(
        colorFilter: ColorFilter.mode(
            ColorUtils.black.withOpacity(0.8), BlendMode.dstATop),
        image: AssetImage(
          ImagesWidgets.foodsImage,
        ),
        fit: BoxFit.cover,
      ),
    );
  }

  /// login
  static BoxDecoration loginBgDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(ImagesWidgets.signInImage),
        fit: BoxFit.fill,
      ),
    );
  }

  /// Forgot
  static DecorationImage forgotPasswordBgDecoration() {
    return DecorationImage(
      image: AssetImage(ImagesWidgets.forgotPasswordDecoration),
      fit: BoxFit.fill,
    );
  }

  ///reset password
  static DecorationImage resetPasswordBgDecoration() {
    return DecorationImage(
      image: AssetImage(ImagesWidgets.resetPasswordImage),
      fit: BoxFit.fill,
    );
  }

  /// register
  static DecorationImage registerBgDecoration() {
    return DecorationImage(
      image: AssetImage(ImagesWidgets.signUpBgImage),
      fit: BoxFit.fill,
    );
  }

  ///Profile
  static BoxDecoration profileDecoration() {
    return BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage(ImagesWidgets.profileBgImage),
        fit: BoxFit.fill,
      ),
    );
  }

  static BoxDecoration profileEditDecoration() {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: ColorUtils.grey6F,
      image: DecorationImage(
        image: AssetImage(ImagesWidgets.profileEditBg),
        scale: 2.8,
      ),
    );
  }

  static BoxDecoration cameraProfileDecoration() {
    // ignore: prefer_const_constructors
    return BoxDecoration(
      shape: BoxShape.circle,
      color: ColorUtils.primaryColor,
    );
  }

  /// Home Screen add Button decorations
  static BoxDecoration addButtonDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(2.0),
      color: ColorUtils.primaryColor,
    );
  }

  /// Featured all decorations
  static BoxDecoration borderSquareDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(1.0),
      color: ColorUtils.white,
      border: Border.all(color: ColorUtils.grey8C),
    );
  }

  static BoxDecoration imageDecorationDecoration() {
    return BoxDecoration(
      color: ColorUtils.grey8C,
      borderRadius: BorderRadius.circular(2.0),
    );
  }

  static BoxDecoration imageBackgroundDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(2.0),
      color: ColorUtils.grey8C,
    );
  }

  static BoxDecoration likeAndUnLikeDecoration() {
    return const BoxDecoration(
      shape: BoxShape.circle,
      color: ColorUtils.grey8E,
    );
  }

  /// BottomBar Screen box decorations
  static BoxDecoration bottomBoxDecoration() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
      // color: ColorUtils.whiteF6,
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  static BoxDecoration checkoutImageDeliveryDecoration() {
    return BoxDecoration(
      color: ColorUtils.lightWhiteBlueFF,
      borderRadius: BorderRadius.circular(2.w),
    );
  }

  static BoxDecoration incrementCounterDelivery() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(9.w),
      color: ColorUtils.greyB8,
    );
  }

  static BoxDecoration formDecorationDeliveryDecoration() {
    return BoxDecoration(
      color: ColorUtils.transparent,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(1.2.w),
        bottomLeft: Radius.circular(1.2.w),
      ),
    );
  }

  static BoxDecoration voucherDecorationDeliveryDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(2.w),
      color: ColorUtils.white,
    );
  }

  /// Trading searching Screen all Decoration

  static BoxDecoration ordershoppingcounterDecoration() {
    return const BoxDecoration(
      color: Colors.red,
      shape: BoxShape.circle,
    );
  }

  static BoxDecoration appbarDecorationDecoration() {
    return const BoxDecoration(
      color: ColorUtils.primaryColor,
    );
  }

  static BoxDecoration trendingSearchTextDecoration() {
    return const BoxDecoration(color: ColorUtils.greyC4);
  }

  /// Trading searching Screen BoxConstraints
  static BoxConstraints ordershoppingcounterBoxContain() {
    return const BoxConstraints(
      minWidth: 14,
      minHeight: 14,
    );
  }

  /// Product Discription Screen All Descripation
  static BoxDecoration imagebackgroundDecoration() {
    return const BoxDecoration(
      color: ColorUtils.greyf3,
    );
  }

  static BoxDecoration offerDecoration() {
    return const BoxDecoration(
      color: ColorUtils.red42,
      shape: BoxShape.circle,
    );
  }

  static BoxDecoration containerDecoration() {
    return const BoxDecoration(
      color: ColorUtils.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)),
    );
  }

  static BoxDecoration orderCounterDecoration() {
    return const BoxDecoration(
      shape: BoxShape.circle,
      color: ColorUtils.greyB8,
    );
  }

  static BoxDecoration buttonsBackGroundDecoration() {
    return const BoxDecoration(
      color: ColorUtils.white,
    );
  }

  /// Post Screen BoxConstraints
  static BoxDecoration boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(2.w),
      color: ColorUtils.white,
    );
  }
}
