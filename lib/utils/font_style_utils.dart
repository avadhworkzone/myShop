import 'color_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

/// FONT FAMILY
// ignore: constant_identifier_names
const String Neusa = "Neusa";

/// ------------------------------------------------------------------- ///
/// FONT WEIGHT
class FontWeightClass {
  static const light = FontWeight.w200;
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiB = FontWeight.w600;
  static const bold = FontWeight.w700;
  static const extraB = FontWeight.w800;
  static const black = FontWeight.w900;
}

/// ------------------------------------------------------------------- ///
/// FONT TEXT STYLE

class FontTextStyle {
  // static TextStyle nunitos20 = TextStyle(
  //   fontWeight: FontWeight.bold,
  //   fontSize: 15.sp,
  // );
  //
  // static TextStyle nunitos15Regular = TextStyle(
  //   fontFamily: Neusa,
  //   fontSize: 12.sp,
  //   fontWeight: FontWeightClass.regular,
  // );

  ///sign in
  static TextStyle loginTitleStyle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightClass.extraB,
    color: ColorUtils.blue4D,
  );

  static TextStyle signInStyle = TextStyle(
    color: ColorUtils.black3D,
    fontFamily: 'Neusa',
    fontSize: 12.sp,
  );
  static TextStyle alreadyStyle = TextStyle(
    height: 0.3.w,
    fontFamily: 'Neusa',
    color: ColorUtils.grey6D,
    fontSize: 12.sp,
  );
  static TextStyle signUpStyle = TextStyle(
    color: ColorUtils.primaryColor,
    fontSize: 12.sp,
  );
  static TextStyle policyStyle = TextStyle(
    color: ColorUtils.primaryColor,
    fontWeight: FontWeight.w700,
    fontSize: 12.sp,
  );
  static TextStyle amountStyle = TextStyle(
    fontWeight: FontWeightClass.bold,
    fontSize: 14.sp,
  );
  static TextStyle errorStyle = TextStyle(fontSize: 11.sp);
  static TextStyle cirtificateStyle = TextStyle(fontSize: 9.sp);

  ///Profile
  static TextStyle cameraStyle = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightClass.semiB,
  );

  /// Button
  static TextStyle buttonTitleStyle = TextStyle(
    color: ColorUtils.white,
    fontSize: 11.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle emailAddresStyle = TextStyle(
    color: ColorUtils.greyB8,
    fontSize: 12.sp,
  );
  static TextStyle forgotPasswordStyle = TextStyle(
    color: ColorUtils.black3D,
    fontSize: 12.sp,
  );

  ///
  static TextStyle categoriesTitleStyle = TextStyle(
    color: ColorUtils.greya3,
    fontWeight: FontWeight.bold,
    fontSize: 12.sp,
  );

  static TextStyle discountRateStyle = const TextStyle(
    color: ColorUtils.grey89,
  );

  static TextStyle strikeRateStyle = const TextStyle(
    decoration: TextDecoration.lineThrough,
    color: ColorUtils.greyC4,
  );

  static TextStyle buttonTextColor = TextStyle(
    color: ColorUtils.white,
    fontWeight: FontWeightClass.bold,
    fontSize: 10.sp,
  );

  ///my cart
  static TextStyle imageTitleDeliveryStyle = TextStyle(
    color: ColorUtils.grey6F,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle imageAmountStyle = TextStyle(
    color: ColorUtils.grey85,
    fontSize: 13.sp,
  );
  static TextStyle imageCounterStyle = TextStyle(
    color: ColorUtils.black3F,
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
  );

  ///rich text style
  static TextStyle addItemsStyle = TextStyle(
    color: ColorUtils.white,
    fontSize: 13.sp,
  );
  static TextStyle freeDeliveryStyle = TextStyle(
    color: ColorUtils.white,
    fontWeight: FontWeightClass.bold,
    fontSize: 15.sp,
  );
  static TextStyle deliverdStyle = TextStyle(
    fontWeight: FontWeight.w600,
    color: ColorUtils.grey6F,
    fontSize: 12.sp,
  );
  static TextStyle enterVoucherCodeStyle = TextStyle(
    fontWeight: FontWeight.w600,
    color: ColorUtils.grey6F,
    fontSize: 12.sp,
  );

  static TextStyle addressDeliveryStyle = TextStyle(
    color: ColorUtils.greyB8,
    fontSize: 12.sp,
  );
  static TextStyle voucherDeliveryStyle = TextStyle(
    fontWeight: FontWeightClass.bold,
    color: ColorUtils.grey6F,
    fontSize: 15.sp,
  );
  static TextStyle bottomSubtitleStyle = TextStyle(
    fontWeight: FontWeightClass.extraB,
    fontSize: 14.sp,
  );

  static TextStyle addDeleStyle = TextStyle(
    color: ColorUtils.grey6F,
    fontSize: 15.sp,
  );

  /// Nointernet Text TextStyle
  static TextStyle noInternetStyle = TextStyle(
    fontWeight: FontWeightClass.semiB,
    fontSize: 12.sp,
  );

  /// Categories home screen sample TextStyle
  static TextStyle categoriesStyle = const TextStyle(
    color: ColorUtils.grey6F,
    fontWeight: FontWeightClass.bold,
  );

  /// food_screen 08 TextStyle
  static TextStyle foodtextStyle = TextStyle(
    fontSize: 15.sp,
    color: ColorUtils.white,
    fontWeight: FontWeightClass.medium,
  );

  /// Featured product All 09 TextStyle
  static TextStyle appbartitleTextStyle = TextStyle(
    fontSize: 15.sp,
    color: ColorUtils.white,
    fontWeight: FontWeightClass.medium,
  );

  static TextStyle darkBrownJacketTextStyle = TextStyle(
    color: ColorUtils.grey89,
    fontWeight: FontWeightClass.medium,
    fontSize: 12.sp,
  );

  static TextStyle fashionTextStyle = TextStyle(
    color: ColorUtils.grey6F,
    fontSize: 16.sp,
    fontWeight: FontWeightClass.medium,
  );

  static TextStyle discountPriceFeatureStyle = TextStyle(
    color: ColorUtils.greyAA,
    fontSize: 12.sp,
  );

  static TextStyle discriptionStyle =
      TextStyle(color: ColorUtils.grey8E, fontSize: 10.sp);

  static TextStyle featuredButtonStyle =
      const TextStyle(color: ColorUtils.white);

  static TextStyle strickPriceFeatureStyle = TextStyle(
    color: ColorUtils.greyAA,
    fontSize: 12.sp,
    decoration: TextDecoration.lineThrough,
  );

  /// Cart Screen All TextStyle
  static TextStyle yourCartIsEmptyStyle = TextStyle(
    color: ColorUtils.grey6F,
    fontSize: 17.sp,
    fontWeight: FontWeightClass.bold,
  );

  static TextStyle cartDiscriptionStyle =
      TextStyle(color: ColorUtils.grey6F, fontSize: 12.sp);

  /// Thank You Screen All TextStyle
  static TextStyle forYourOrderStyle = TextStyle(
    color: ColorUtils.grey8E,
    fontSize: 22.sp,
    fontWeight: FontWeightClass.bold,
  );

  static TextStyle orderNumberStyle = TextStyle(
    color: ColorUtils.grey8E,
    fontSize: 12.sp,
    fontWeight: FontWeightClass.bold,
  );

  static TextStyle estimatedDeliveryStyle = TextStyle(
    color: ColorUtils.pink69,
    fontSize: 15.sp,
  );

  /// Rate And Review Screen All TextStyle
  static TextStyle rateYourExperienceStyle =
      TextStyle(color: ColorUtils.lightgreyBA, fontSize: 14.sp);

  static TextStyle hinttextStyle =
      const TextStyle(fontSize: 15, color: ColorUtils.greyB8);

  static TextStyle inputText = const TextStyle(color: ColorUtils.greyB8);

  /// Terms And Condition All TextStyle
  static TextStyle termsAndConditionDiscriptionStyle = TextStyle(
    color: ColorUtils.grey7E,
    fontSize: 12.sp,
  );

  /// Setting Screen
  static TextStyle accountStyle = TextStyle(
    color: ColorUtils.black55,
    fontSize: 11.sp,
    fontWeight: FontWeightClass.bold,
  );

  static TextStyle alertboxtStyle = TextStyle(
    color: ColorUtils.blue68,
    fontSize: 15.sp,
    fontWeight: FontWeightClass.medium,
  );

  /// Treding Screen All TextStyle
  static TextStyle searchHintStyle = const TextStyle(
    color: ColorUtils.white,
  );

  static TextStyle displayordercounterStyle = const TextStyle(
    color: Colors.white,
    fontSize: 8,
  );

  static TextStyle trendingSearchStyle = TextStyle(
    color: ColorUtils.black22,
    fontSize: 11.sp,
    fontWeight: FontWeightClass.medium,
    letterSpacing: 0.2,
  );

  static TextStyle listTileStyle = TextStyle(
    color: ColorUtils.black22,
    fontSize: 12.sp,
    letterSpacing: 0.2,
  );

  static TextStyle noResultFoundStyle = TextStyle(fontSize: 12.sp);

  /// Product Discription TextStyle
  static TextStyle darkBrownJacketStyle = TextStyle(
    color: ColorUtils.grey8E,
    fontSize: 12.5.sp,
    fontWeight: FontWeightClass.bold,
  );

  static TextStyle offerTextStyle = const TextStyle(color: ColorUtils.white);

  static TextStyle productStyle = TextStyle(
    color: ColorUtils.grey6F,
    fontSize: 12.sp,
    fontWeight: FontWeightClass.bold,
  );

  static TextStyle productDiscriptionStyle = TextStyle(
    color: ColorUtils.greyA5,
    fontSize: 10.sp,
    fontWeight: FontWeightClass.bold,
  );

  static TextStyle priceStyle = TextStyle(
    color: ColorUtils.greyAA,
    fontSize: 15.sp,
    decoration: TextDecoration.lineThrough,
  );

  static TextStyle discountStyle = TextStyle(
    color: ColorUtils.grey8E,
    fontWeight: FontWeightClass.bold,
    fontSize: 15.sp,
  );

  static TextStyle oderStatusCounterStyle = TextStyle(
    color: ColorUtils.black3F,
    fontSize: 12.sp,
    fontWeight: FontWeightClass.bold,
  );

  static TextStyle additionalInformationStyle = TextStyle(
    color: ColorUtils.grey8E,
    fontSize: 12.5.sp,
    fontWeight: FontWeightClass.bold,
  );

  static TextStyle additionalInformationDiscripationStyle =
      const TextStyle(color: ColorUtils.greyA5);

  static TextStyle lessReadMoreStyle = TextStyle(
    color: ColorUtils.pink69,
    fontSize: 11.sp,
    fontWeight: FontWeightClass.medium,
  );

  static TextStyle youMayAlsoLikeStyle = TextStyle(
    color: ColorUtils.grey6F,
    fontSize: 12.sp,
    fontWeight: FontWeightClass.bold,
  );

  /// Shopping Cart Screen All TextStyle
  static TextStyle shopScreenAppbarTitleStyle = TextStyle(
    fontSize: 17.sp,
    color: ColorUtils.white,
    fontWeight: FontWeightClass.medium,
  );

  /// My Order Screen All TextStyle
  static TextStyle pendingOrderStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
  );
  static TextStyle orderIdStyle = TextStyle(
    fontSize: 12.sp,
    color: ColorUtils.greyB8,
    fontWeight: FontWeight.w400,
  );
  static TextStyle amountTextStyle = TextStyle(
    fontSize: 13.sp,
    color: ColorUtils.black22,
    fontWeight: FontWeight.w700,
  );
  static TextStyle trackingStatusStyle = TextStyle(
    fontSize: 12.sp,
    color: ColorUtils.greyB8,
    fontWeight: FontWeight.w400,
  );
  static TextStyle paymentSuccessStyle = TextStyle(
    fontSize: 12.sp,
    color: ColorUtils.yellow20,
    fontWeight: FontWeight.w600,
  );

  /// poat order
  static TextStyle addressPostStyle = TextStyle(
    fontSize: 12.sp,
    color: ColorUtils.grey8E,
    fontWeight: FontWeight.w600,
  );
  static TextStyle placeOnPostStyle = TextStyle(
    fontSize: 12.sp,
    color: ColorUtils.grey8E,
    fontWeight: FontWeight.w600,
  );
  static TextStyle deliveryChargeStyle = TextStyle(
    fontSize: 11.sp,
    color: ColorUtils.greyC4,
    fontWeight: FontWeight.w500,
  );
  static TextStyle delivedSuccessStyle = TextStyle(
    fontSize: 12.sp,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );
  static TextStyle deliverdOnStyle = TextStyle(
    fontSize: 11.sp,
    color: ColorUtils.black22,
    fontWeight: FontWeight.w400,
  );
  static TextStyle payOnlineStyle = TextStyle(
    fontSize: 11.sp,
    color: ColorUtils.black22,
    fontWeight: FontWeight.w400,
  );
  static TextStyle itemsStyle = TextStyle(
    fontSize: 12.sp,
    color: ColorUtils.black22,
    fontWeight: FontWeight.w800,
  );
  static TextStyle amtStyle = TextStyle(
    fontSize: 11.sp,
    color: ColorUtils.grey6F,
    fontWeight: FontWeight.w600,
  );
}
