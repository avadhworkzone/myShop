import 'dart:developer';
import 'package:get/get.dart';
import 'package:my_shop/controllers/bottom_bar_controller.dart';
import 'package:my_shop/modal/apiModel/request_model/my_cart_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/remove_cart_product_req.dart';
import 'package:my_shop/modal/apiModel/request_model/update_cart_qty_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/my_cart_res_model.dart';
import 'package:my_shop/view/general/bottombar_screens/card/my_cart.dart';
import 'package:my_shop/viewModel/cart_view_model.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../commanWidget/custom_snackbar.dart';
import '../../../../controllers/trading_serching_controller.dart';
import '../../../../modal/apiModel/request_model/add_to_cart_req_model.dart';
import '../../../../modal/apis/api_response.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/shared_preference_utils.dart';
import '../../../login/signIn.dart';
import '../../checkout/checkout_screen.dart';
import '../../../../utils/variable_utils.dart';
import '../../../../utils/decoration_utils.dart';
import '../../../../utils/font_style_utils.dart';
import '../../../../utils/size_config_utils.dart';
import '../../../../commanWidget/custom_btn.dart';
import '../../../../utils/assets/icons_utils.dart';
import '../../../../utils/assets/images_utils.dart';
import '../../../../controllers/delivery_controller.dart';
import '../bottombar_screen.dart';

class ShoppingCart extends StatefulWidget {
  ShoppingCart({Key? key, this.redirectCartScreen,this.isBottomNavigation}) : super(key: key);

  bool? redirectCartScreen;
  bool? isBottomNavigation;
  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

/// Order nu counter aave che aa Trading Screen Controller mathi atle
TradingSearchingController tradingSearchingController =
    Get.put(TradingSearchingController());

MyCartListReqModel myCartListReqModel = MyCartListReqModel();
DeliveryController deliveryController = Get.find();

CartViewModel cartViewModel = Get.find();

RemoveProductToCartReqModel removeProductToCartReqModel =
    RemoveProductToCartReqModel();
UpdateCartQtyReqModel updateCartQtyReqModel = UpdateCartQtyReqModel();

CustomSnackbar snackbar = CustomSnackbar();
ProductAddToCartReqModel productAddToCartReqModel = ProductAddToCartReqModel();

BottombarController bottombarController = Get.find();

class _ShoppingCartState extends State<ShoppingCart> {
  int decrement = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (PreferenceUtils.getUserId().isNotEmpty) {
        addToCart();
      }
    });
    super.initState();
  }

  String? id;
  String? qtys;

  Future addToCart() async {
    log('top===${cartViewModel.addToCartLocalData}');
    if (cartViewModel.addToCartLocalData.isNotEmpty) {
      cartViewModel.addToCartLocalData.clear();
      cartViewModel.addToCartLocalData.forEach((element) {
        id = element["id"];
        qtys = element["qty"].toString();
        print('qty isssssss${element["qty"]}');
      });
      productAddToCartReqModel.productId = id;
      productAddToCartReqModel.qty = qtys;
      productAddToCartReqModel.userId = PreferenceUtils.getUserId();
      await cartViewModel.productAddToCartViewModel(productAddToCartReqModel);
      cartViewModel.addToCartLocalData.clear();
    }
    log('top.....${cartViewModel.addToCartLocalData}');
    myCart();
  }

  myCart() async {
    myCartListReqModel.userId = PreferenceUtils.getUserId();
    await cartViewModel.myCartListViewModel(myCartListReqModel);
    MyCartListResModel response = cartViewModel.myCartApiResponse.data;
    cartViewModel.addToCartLocalData.clear();
    response.data!.forEach((element) {
      cartViewModel.addToCartLocalData.add({
        "id": element.productId,
        "img": element.img,
        "productName": element.product,
        "price": element.price,
        "qty": int.parse(element.qty!)
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PreferenceUtils.getUserId().isEmpty
        ? cartViewModel.addToCartLocalData.isEmpty
            ? MyCart()
            : MyShopingCartData()
        : MyShopingCartData();
  }

  Widget MyShopingCartData() {
    return Scaffold(
      backgroundColor: ColorUtils.lightWhiteBlueFF,
      body: Column(
        children: [

          /// TOP APP BAR

          Container(
            height: 24.w,
            width: double.infinity,
            decoration: DecorationUtils.appbarDecorationDecoration(),
            child: Container(
              margin: EdgeInsets.only(top: 9.w),
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Row(
                children: [
                  widget.isBottomNavigation==true?SizedBox():InkWell(
                    onTap: () {
                      if (widget.redirectCartScreen == true) {
                        bottombarController.selectedIndex .value = 0;
                        Get.to(BottomScreen());
                      } else {
                        Get.back();
                      }
                    },
                    child: IconUtils.backArrrow,
                  ),
                  SizeConfig.sW5,
                  Text(
                    VariableUtils.myCartText,
                    style: FontTextStyle.shopScreenAppbarTitleStyle,
                  ),
                  const Spacer(),
                  Stack(
                    children: <Widget>[
                      IconButton(
                        icon: IconUtils.shoppingCarticon,
                        onPressed: () {},
                      ),
                      Positioned(
                        right: 1.w,
                        top: 2.w,
                        child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: DecorationUtils
                                .ordershoppingcounterDecoration(),
                            constraints: DecorationUtils
                                .ordershoppingcounterBoxContain(),
                            child: GetBuilder<CartViewModel>(
                                builder: (controller) {
                              int total = 0;
                              controller.addToCartLocalData.forEach((element) {
                                int qty = element["qty"];
                                // print('before qty ${element["qty"]}');
                                total += qty;
                                // print('after qty ${qty}');
                              });
                              return Text(
                                '${total}',
                                style: FontTextStyle.displayordercounterStyle,
                                textAlign: TextAlign.center,
                              );
                            })),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// LIST FOR SHOW DATA

          Expanded(
            child: GetBuilder<CartViewModel>(
              builder: (myCartController) {
                if (myCartController.myCartApiResponse.status ==
                        Status.LOADING ||
                    myCartController.addToCartApiResponse.status ==
                        Status.LOADING) {
                  return Center(child: const CircularProgressIndicator());
                }
                if (myCartController.myCartApiResponse.status == Status.ERROR) {
                  const Text('error');
                }

                return ListView.builder(
                  itemCount: myCartController.addToCartLocalData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(4.w, 4.w, 4.w, 0.w),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(3.w),
                            color: ColorUtils.white,
                            child: Row(
                              children: [
                                Container(
                                    height: 25.w,
                                    width: 21.w,
                                    decoration: DecorationUtils
                                        .checkoutImageDeliveryDecoration(),
                                    child: FadeInImage(
                                      placeholder: NetworkImage(
                                          // response.data![index].img!,
                                          myCartController
                                                  .addToCartLocalData[index]
                                              ["img"]),
                                      imageErrorBuilder:
                                          (context, error, stack) {
                                        return SizedBox(
                                          // width: 15.w,
                                          child: Image.asset(
                                            "assets/icons/no-image-found.png",
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                      image: NetworkImage(myCartController
                                          .addToCartLocalData[index]["img"]),
                                      height: 50.w,
                                      fit: BoxFit.fill,
                                    )),
                                SizeConfig.sW5,
                                SizedBox(
                                  height: 28.w,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 60.w,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${myCartController.addToCartLocalData[index]["productName"]}',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: FontTextStyle
                                                    .imageTitleDeliveryStyle,
                                              ),
                                            ),

                                            /// PRODUCT DELETE BUTTON

                                            InkWell(
                                                onTap: () async {
                                                  if (PreferenceUtils
                                                          .getUserId()
                                                      .isNotEmpty) {
                                                    removeProductToCartReqModel
                                                            .productId =
                                                        myCartController
                                                                .addToCartLocalData[
                                                            index]["id"];
                                                    removeProductToCartReqModel
                                                            .userId =
                                                        PreferenceUtils
                                                            .getUserId();
                                                    await cartViewModel
                                                        .removeCartListViewModel(
                                                            removeProductToCartReqModel);
                                                    myCartController
                                                        .addToCartLocalData
                                                        .removeWhere((element) =>
                                                            element["id"] ==
                                                            myCartController
                                                                    .addToCartLocalData[
                                                                index]["id"]);
                                                    myCartController.update();
                                                    log('remove=====${myCartController.addToCartLocalData}');
                                                    Future.delayed(
                                                        const Duration(
                                                            milliseconds: 1),
                                                        () async {
                                                      await cartViewModel
                                                          .myCartListViewModel(
                                                              myCartListReqModel);
                                                    });
                                                  } else {
                                                    myCartController
                                                        .addToCartLocalData
                                                        .removeWhere((element) =>
                                                            element["id"] ==
                                                            myCartController
                                                                    .addToCartLocalData[
                                                                index]["id"]);
                                                  }
                                                  myCartController.update();
                                                },
                                                child: ImagesWidgets
                                                    .deleteDeliveryImage)
                                          ],
                                        ),
                                      ),
                                      Text(
                                        '\$${myCartController.addToCartLocalData[index]["price"]} X ${myCartController.addToCartLocalData[index]["qty"]}',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: FontTextStyle.imageAmountStyle,
                                      ),

                                      /// QTY INCREMENT AND DECREMENT BUTTON

                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              int? updatedDecrementQty;
                                              if (myCartController
                                                          .addToCartLocalData[
                                                      index]["qty"] ==
                                                  1) {
                                                if (PreferenceUtils.getUserId()
                                                    .isNotEmpty) {
                                                  removeProductToCartReqModel
                                                          .productId =
                                                      myCartController
                                                              .addToCartLocalData[
                                                          index]["id"];
                                                  log('id${myCartController.addToCartLocalData[index]["id"]}');
                                                  removeProductToCartReqModel
                                                          .userId =
                                                      PreferenceUtils
                                                          .getUserId();
                                                  await cartViewModel
                                                      .removeCartListViewModel(
                                                          removeProductToCartReqModel);
                                                  myCartController
                                                      .addToCartLocalData
                                                      .removeWhere((element) =>
                                                          element["id"] ==
                                                          myCartController
                                                                  .addToCartLocalData[
                                                              index]["id"]);
                                                  myCartController.update();
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 1),
                                                      () async {
                                                    await cartViewModel
                                                        .myCartListViewModel(
                                                            myCartListReqModel);
                                                  });
                                                  log('removeProductToCartReqModel${removeProductToCartReqModel.toJson()}');
                                                } else {
                                                  myCartController
                                                      .addToCartLocalData
                                                      .removeWhere((element) =>
                                                          element["id"] ==
                                                          myCartController
                                                                  .addToCartLocalData[
                                                              index]["id"]);
                                                }
                                                myCartController.update();
                                              } else {
                                                updatedDecrementQty =
                                                    myCartController
                                                            .addToCartLocalData[
                                                        index]["qty"] -= 1;
                                                if (PreferenceUtils.getUserId()
                                                    .isNotEmpty) {
                                                  updateCartQtyReqModel
                                                          .productId =
                                                      myCartController
                                                              .addToCartLocalData[
                                                          index]["id"];
                                                  updateCartQtyReqModel.userId =
                                                      PreferenceUtils
                                                          .getUserId();
                                                  updateCartQtyReqModel.qty =
                                                      updatedDecrementQty
                                                          .toString();

                                                  await cartViewModel
                                                      .updateCartQtyViewModel(
                                                          updateCartQtyReqModel);
                                                }

                                                cartViewModel.update();
                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(1.w),
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: ColorUtils.greyB8,
                                              ),
                                              child: Icon(
                                                Icons.remove,
                                                size: 5.w,
                                                color: ColorUtils.white,
                                              ),
                                            ),
                                          ),
                                          SizeConfig.sW3,
                                          Text(
                                            '${myCartController.addToCartLocalData[index]["qty"]}',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style:
                                                FontTextStyle.imageCounterStyle,
                                          ),
                                          SizeConfig.sW3,
                                          InkWell(
                                            onTap: () async {
                                              int? updatedIncrementQty;

                                              if (PreferenceUtils.getUserId()
                                                  .isNotEmpty) {
                                                updateCartQtyReqModel
                                                        .productId =
                                                    myCartController
                                                            .addToCartLocalData[
                                                        index]["id"];
                                                updateCartQtyReqModel.userId =
                                                    PreferenceUtils.getUserId();
                                                updateCartQtyReqModel.qty =
                                                    updatedIncrementQty
                                                        .toString();
                                                await cartViewModel
                                                    .updateCartQtyViewModel(
                                                        updateCartQtyReqModel);
                                              } else {
                                                updatedIncrementQty =
                                                    myCartController
                                                            .addToCartLocalData[
                                                        index]["qty"] += 1;
                                              }
                                              cartViewModel.update();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(1.w),
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: ColorUtils.greyB8,
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                size: 5.w,
                                                color: ColorUtils.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizeConfig.sH2,
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),

          /// CUSTOM ADD BANNER

          Container(
            margin: EdgeInsets.all(2.w),
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
              color: ColorUtils.grey8E,
              borderRadius: BorderRadius.circular(1.w),
            ),
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: VariableUtils.addDeliveryText,
                      style: FontTextStyle.addItemsStyle,
                    ),
                    TextSpan(
                      text: VariableUtils.freeDeliveryText,
                      style: FontTextStyle.freeDeliveryStyle,
                    ),
                  ],
                ),
              ),
              trailing: ImagesWidgets.truckImage,
            ),
          ),

          /// BOTTOM BAR PLACE ORDER BUTTON

          Container(
            height: 10.h,
            color: ColorUtils.white,
            alignment: Alignment.center,
            child: ListTile(
              title: const Text(
                VariableUtils.subTotalDeliveryText,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              subtitle: Text(
                VariableUtils.amountDeliveryText,
                style: FontTextStyle.bottomSubtitleStyle,
              ),
              trailing: CustomBtn(
                onTap: () {
                  PreferenceUtils.getLogin() == 0
                      ? Get.to(SignIn(
                          isnavigate: true,
                        ))
                      : Get.to(() => const CheckOut());
                },
                width: 45.w,
                radius: 2.w,
                style: FontTextStyle.buttonTitleStyle,
                title: VariableUtils.placeOrderText,
                bgColor: ColorUtils.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// appBar: PreferredSize(
//   preferredSize: Size.fromHeight(15.w),
//   child: appbar(
//     context,
//     false,
//     VariableUtils.myCart,
//     () {},
//     () {},
//     IconUtils.backArrrow,
//     Stack(
//       children: <Widget>[
//         IconButton(
//           icon: IconUtils.shoppingCarticon,
//           onPressed: () {
//             tradingSearchingController.shoppingcounter();
//           },
//         ),
//         Obx(
//           () => tradingSearchingController.shoppingCounter.value != 0
//               ? Positioned(
//                   right: 1.w,
//                   top: 2.w,
//                   child: Container(
//                     padding: const EdgeInsets.all(2),
//                     decoration:
//                         DecorationUtils.ordershoppingcounterDecoration(),
//                     constraints:
//                         DecorationUtils.ordershoppingcounterBoxContain(),
//                     child: Text(
//                       '${tradingSearchingController.shoppingCounter.value}',
//                       style: FontTextStyle.displayordercounterStyle,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 )
//               : const SizedBox(),
//         ),
//       ],
//     ),
//   ),
// ),
