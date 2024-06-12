// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, avoid_print

import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:my_shop/utils/decoration_utils.dart';
import 'package:my_shop/utils/font_style_utils.dart';
import 'package:my_shop/view/general/bottombar_screens/wishlist/my_wishlist.dart';
import 'package:my_shop/viewModel/cart_view_model.dart';

import '../../../controllers/bottom_bar_controller.dart';
import 'card/my_cart.dart';
import 'package:get/get.dart';
import 'home/home_screen.dart';
import 'card/shopping_cart.dart';
import 'package:sizer/sizer.dart';
import 'more/setting_screen.dart';
import 'profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'home/featured_product.dart';
import 'search/trending_searches.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/variable_utils.dart';
import '../../../utils/assets/images_utils.dart';
import '../../../utils/shared_preference_utils.dart';
import '../product_description/product_description.dart';
import '../../../view/general/bottombar_screens/home/all_Categories.dart';

class BottomScreen extends StatefulWidget {
  @override
  _BottomScreenState createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  BottombarController bottombarController = Get.find();
  CartViewModel cartViewModel = Get.find();
  List<dynamic> pages = [
    Get.arguments == 'categoriesBtn'
        ? AllCategories()
        : Get.arguments == 'newArrivalBtn'
            ? FeaturedProduct()
            // :
            // Get.arguments == 'todayOffers'
            //             ? ProductDescription()
            : const HomeScreen(),
     Trading_Serching(isBottomNavigation: true),
    ShoppingCart(isBottomNavigation: true),
    // PreferenceUtils.getShoppingCart() == 1 ? const ShoppingCart() : MyCart(),
    MyWishList(isBottomNavigation: true),
    SettingScreen(isBottomNavigation: true),
  ];

  onTap(int index) {
    // log(index.toString());
    bottombarController.pageChange(index);
    log(bottombarController.selectedIndex.value.toString());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        if(bottombarController.selectedIndex.value == 0){
          SystemNavigator.pop();
        }
        bottombarController.selectedIndex.value=0;
        return Future.value(false);
      },
      child: Scaffold(
        body: Obx(
          () => pages[bottombarController.selectedIndex.value],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: bottombarController.selectedIndex.value,
            onTap: onTap,
            backgroundColor: ColorUtils.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorUtils.lightPink63,
            selectedFontSize: 12.sp,
            items: [
              BottomNavigationBarItem(
                activeIcon: IconsWidgets.activeHomeImage,
                icon: IconsWidgets.homeImage,
                label: VariableUtils.home,
              ),
              BottomNavigationBarItem(
                activeIcon: IconsWidgets.activeSearchImage,
                icon: IconsWidgets.searchImage,
                label: VariableUtils.searchText,
              ),
              BottomNavigationBarItem(
                activeIcon: Stack(
                  children: [
                    IconsWidgets.activeCartImage,
                    Positioned(
                      right: 2.9.w,
                      bottom: 2.5.w,
                      child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: DecorationUtils
                              .ordershoppingcounterDecoration(),
                          child: GetBuilder<CartViewModel>(
                              builder: (controller) {
                                int total = 0;
                                controller.addToCartLocalData.forEach((element) {
                                  int qty = element["qty"];
                                  total += qty;
                                });
                                return Text(
                                  '${total}',
                                  style: FontTextStyle.displayordercounterStyle.copyWith(fontSize: 6.sp),
                                  textAlign: TextAlign.center,
                                );
                              })),
                    )
                  ],
                ),
                icon: Stack(
                  children: [
                    IconsWidgets.cartImage,
                    Positioned(
                      right: 2.9.w,
                      bottom: 1.5.w,
                      child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: DecorationUtils
                              .ordershoppingcounterDecoration(),
                          child: GetBuilder<CartViewModel>(
                              builder: (controller) {
                                int total = 0;
                                controller.addToCartLocalData.forEach((element) {
                                  int qty = element["qty"];
                                  total += qty;
                                });
                                return Text(
                                  '${total}',
                                  style: FontTextStyle.displayordercounterStyle.copyWith(fontSize: 6.sp),
                                  textAlign: TextAlign.center,
                                );
                              })),
                    )
                  ],
                ),
                label: VariableUtils.cartText,
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.favorite, size: 5.w),
                icon: Icon(Icons.favorite_border, size: 4.5.w),
                label: VariableUtils.wishList,
              ),
              BottomNavigationBarItem(
                activeIcon: IconsWidgets.activeMoreImage,
                icon: IconsWidgets.moreImage,
                label: VariableUtils.moreText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
