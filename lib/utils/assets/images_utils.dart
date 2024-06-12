import '../color_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

String imagesbasePath = 'assets/images/';
String iconsbasePath = 'assets/icons/';

/// Images
class ImagesWidgets {
  static Image splashScreenImage = Image.asset(
    "${imagesbasePath}splash.png",
    fit: BoxFit.fill,
  );

  /// No Internet Image
  static Image noInternetImage = Image.asset(
    'assets/images/nointernet.png',
    scale: 2,
  );

  /// Login Screen
  static String gmailImage = "${iconsbasePath}mail.png";
  static String userImage = "${iconsbasePath}user.png";
  static String mobileImage = "${iconsbasePath}mobile.png";
  static String signInImage = "${imagesbasePath}signin.png";
  static String visiblityImage = "${iconsbasePath}visiblity.png";
  static String visiblityOffImage = "${iconsbasePath}visibility_off.png";
  static String forgotPasswordImage = "${imagesbasePath}forgot_password.png";

  static String signUpBgImage = "${imagesbasePath}signup.png";

  ///profile
  static String profileBgImage = "${imagesbasePath}user.png";
  static String profileEditBg = "${iconsbasePath}edit.png";
  static String forgotPasswordDecoration =
      "${imagesbasePath}forgot_password.png";

  ///reset password image
  static String resetPasswordImage = "${imagesbasePath}resetPassword.png";

  ///payments
  static String cashPaymentImage = "${iconsbasePath}cash.png";
  static String visaPaymentImage = "${iconsbasePath}visa.png";
  static String creditPaymentImage = "${iconsbasePath}credit.png";
  static String laptopPaymentImage = "${iconsbasePath}laptop.png";
  static String upiPaymentImage = "${iconsbasePath}upi.png";
  static String moneyPaymentImage = "${iconsbasePath}money.png";

  static List paymentImageList = [
    cashPaymentImage,
    visaPaymentImage,
    creditPaymentImage,
    laptopPaymentImage,
    upiPaymentImage,
    moneyPaymentImage,
  ];

  static Image signUpImage = Image.asset(
    "${imagesbasePath}signup.png",
    fit: BoxFit.fill,
  );

  static Image calendarImage = Image.asset(
    "${iconsbasePath}calendar.png",
    // fit: BoxFit.fill,
    color: ColorUtils.grey6F,
    fit: BoxFit.contain,
    scale: 4.h,
  );
  static Image calendar = Image.asset(
    "${iconsbasePath}calendar.png",
    fit: BoxFit.fill,
  );

  /// Home Screen Ads
  static Image bannerAds1Image = Image.asset(
    "${imagesbasePath}banner1.png",
    fit: BoxFit.fill,
  );
  static Image bannerAds2Image = Image.asset(
    "${imagesbasePath}banner2.png",
    fit: BoxFit.fill,
  );
  static Image bannerAds3Image = Image.asset(
    "${imagesbasePath}banner3.png",
    fit: BoxFit.fill,
  );

  /// Home Screen Categories
  static Image categories1Image = Image.asset(
    "${imagesbasePath}categories1.png",
    fit: BoxFit.fill,
    height: 7.h,
  );
  static Image categories2Image = Image.asset(
    "${imagesbasePath}categories2.png",
    fit: BoxFit.fill,
    height: 7.h,
  );
  static Image categories3 = Image.asset(
    "${imagesbasePath}categories3.png",
    fit: BoxFit.fill,
    height: 7.h,
  );
  static Image categories4Image = Image.asset(
    "${imagesbasePath}categories4.png",
    fit: BoxFit.fill,
    height: 7.h,
  );

  static Image boarding1Image = Image.asset(
    "${imagesbasePath}boarding1.jpg",
    height: 50.h,
    fit: BoxFit.fill,
  );
  static Image boarding2Image = Image.asset(
    "${imagesbasePath}boarding2.jpg",
    fit: BoxFit.fill,
    height: 50.h,
  );
  static Image boarding3Image = Image.asset(
    "${imagesbasePath}boarding3.jpg",
    fit: BoxFit.fill,
    height: 50.h,
  );

  /// All Categories images
  static Image img1Image = Image.asset(
    "${imagesbasePath}1.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image img2Image = Image.asset(
    "${imagesbasePath}2.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image img3Image = Image.asset(
    "${imagesbasePath}3.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image img4Image = Image.asset(
    "${imagesbasePath}4.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image img5Image = Image.asset(
    "${imagesbasePath}5.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image img6Image = Image.asset(
    "${imagesbasePath}6.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image img7Image = Image.asset(
    "${imagesbasePath}7.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image img8Image = Image.asset(
    "${imagesbasePath}8.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image img9Image = Image.asset(
    "${imagesbasePath}9.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image img10Image = Image.asset(
    "${imagesbasePath}10.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image img11Image = Image.asset(
    "${imagesbasePath}11.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image img12Image = Image.asset(
    "${imagesbasePath}12.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image img13Image = Image.asset(
    "${imagesbasePath}13.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image img14Image = Image.asset(
    "${imagesbasePath}14.png",
    fit: BoxFit.fill,
    height: 10.h,
  );

  /// home screen New Arrival sample
  static Image arrival1Image = Image.asset(
    "${imagesbasePath}laptop.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image arrival2Image = Image.asset(
    "${imagesbasePath}glass.png",
    fit: BoxFit.fill,
    height: 7.h,
  );
  static Image arrival3Image = Image.asset(
    "${imagesbasePath}tShirt.png",
    fit: BoxFit.fill,
    height: 7.h,
  );

  /// Trending Searches Screen images
  static Image machinePowerImage = Image.asset(
    "${imagesbasePath}powder.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image phonesImage = Image.asset(
    "${imagesbasePath}mobiles.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image clothesImage = Image.asset(
    "${imagesbasePath}clothes.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image electronicImage = Image.asset(
    "${imagesbasePath}electronic.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image homeImage = Image.asset(
    "${imagesbasePath}home_set.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image appliancesImage = Image.asset(
    "${imagesbasePath}appliance.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image travelsImage = Image.asset(
    "${imagesbasePath}travel.png",
    fit: BoxFit.fill,
    height: 10.h,
  );
  static Image groupImage = Image.asset(
    "${imagesbasePath}group.png",
    color: ColorUtils.white,
    height: 5.w,
  );

  static String foodsImage = "${imagesbasePath}foods.png";

  /// Cart Screen Images
  static Image cartVectorImage = Image.asset(
    "${imagesbasePath}cart_vector.png",
    width: 85.w,
  );

  /// Thank you Order screen
  static Image thankYouVectorImage = Image.asset(
    "${imagesbasePath}thank_order_vector.png",
    width: 85.w,
  );

  ///delivery screen
  static Image deleteDeliveryImage = Image.asset(
    "${iconsbasePath}delete.png",
    scale: 3,
  );

  ///payment
  static Image creditCirtificateImage = Image.asset(
    "${iconsbasePath}check.png",
    scale: 1.3.h,
  );
  static Image checkCirtificateImage = Image.asset(
    "${iconsbasePath}check.png",
    scale: 1.3.h,
  );
  static Image productCirtificateImage = Image.asset(
    "${iconsbasePath}product-return.png",
    scale: 1.3.h,
  );
  static Image profileCalenderImage = Image.asset(
    "${iconsbasePath}calendar.png",
    fit: BoxFit.fill,
    color: ColorUtils.pink69,
  );

  static Image profileUpdateImage = Image.asset(
    ImagesWidgets.profileBgImage,
    fit: BoxFit.cover,
    scale: 2.8,
  );
  static Image editAppbarImage = Image.asset(
    "assets/icons/editProfileIcon.png",
    scale: 0.9.w,
  );

  static Image editDeliveryImage = Image.asset(
    "assets/icons/edit_product.png",
    scale: 0.8.w, //3
  );
  static Image editProductImage = Image.asset("assets/icons/user_profile.png");
  static Image truckImage = Image.asset("assets/images/truck.png");
}

/// Images type Icons

class IconsWidgets {
  /// BottomBar Icons
  static Image homeImage = Image.asset(
    "${iconsbasePath}home.png",
    height: 4.w,
  );
  static Image searchImage = Image.asset(
    "${iconsbasePath}search.png",
    height: 4.w,
  );
  static Image cartImage = Image.asset(
    "${iconsbasePath}cart.png",
    height: 4.5.w,
    width: 12.w,
  );
  static Image profileImage = Image.asset(
    "${iconsbasePath}profile.png",
    height: 4.w,
  );
  static Image moreImage = Image.asset(
    "${iconsbasePath}more.png",
    height: 4.w,
  );

  /// Login Screen Icons
  static Image mobileImage = Image.asset(
    "${iconsbasePath}mobile.png",
    height: 4.w,
  );
  static Image userImage = Image.asset(
    "${iconsbasePath}user.png",
    height: 4.w,
  );

  /// BottomBar Active Icons Format

  static Image activeHomeImage = Image.asset(
    "${iconsbasePath}home.png",
    color: ColorUtils.lightPink63,
    height: 5.w,
  );
  static Image activeSearchImage = Image.asset(
    "${iconsbasePath}search.png",
    color: ColorUtils.lightPink63,
    height: 5.w,
  );
  static Image activeCartImage = Image.asset(
    "${iconsbasePath}cart.png",
    color: ColorUtils.lightPink63,
    // height: 5.w,
    height: 5.5.w,
    width: 12.w,
  );
  static Image activeProfileImage = Image.asset(
    "${iconsbasePath}profile.png",
    color: ColorUtils.lightPink63,
    height: 5.w,
  );
  static Image activeMoreImage = Image.asset(
    "${iconsbasePath}more.png",
    color: ColorUtils.lightPink63,
    height: 5.w,
  );

  /// Appbar action Icon
  static Image notificationIconImage = Image.asset(
    "${iconsbasePath}notification.png",
    width: 6.7.w,
  );

  /// Post Screen Icon
  static Image orderSuccessIconImage = Image.asset(
    "assets/icons/tick.png",
    scale: 2.sp,
  );

  static Image payOnlineIconImage = Image.asset(
    "assets/icons/pay_cart.png",
    scale: 0.6.w,
  );

  static Image shoppingCartIconImage = Image.asset(
    "assets/icons/shoppingcart.png",
    scale: 0.6.w,
  );

  static Image diliverTickIconImage = Image.asset(
    "assets/icons/tick.png",
    color: ColorUtils.pink69,
    scale: 0.6.w,
  );

  static Image editIconImage = Image.asset(
    "assets/icons/editProfileIcon.png",
    scale: 0.9.w,
  );
}
