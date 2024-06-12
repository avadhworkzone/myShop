import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_shop/commanWidget/custom_snackbar.dart';
import 'package:my_shop/modal/apiModel/request_model/add_to_cart_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/get_my_wishlist_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/remove_wishlist_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/add_to_cart_res_model.dart';
import 'package:my_shop/modal/apiModel/response_model/get_my_wishlist_res_model.dart';
import 'package:my_shop/viewModel/cart_view_model.dart';
import 'package:my_shop/viewModel/wishlist_view_model.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../../../../commanWidget/common_appbar.dart';
import '../../../../modal/apis/api_response.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/shared_preference_utils.dart';
import '../../../../utils/variable_utils.dart';
import '../../../../utils/decoration_utils.dart';
import '../../../../utils/font_style_utils.dart';
import '../../../../utils/size_config_utils.dart';
import '../../../../utils/assets/icons_utils.dart';
import '../../../../utils/assets/images_utils.dart';

class MyWishList extends StatefulWidget {
  MyWishList({Key? key,this.isBottomNavigation}) : super(key: key);

  bool? isBottomNavigation;
  @override
  State<MyWishList> createState() => _MyWishListState();
}

class _MyWishListState extends State<MyWishList> {
  WishListViewModel wishListViewModel = Get.find();
  GetMyWishListReqModel getMyWishListReqModel = GetMyWishListReqModel();
  RemoveWishlistReqModel removeWishlistReqModel = RemoveWishlistReqModel();
  CartViewModel cartViewModel = Get.find();
  ProductAddToCartReqModel productAddToCartReqModel =
      ProductAddToCartReqModel();
  CustomSnackbar snackbar = CustomSnackbar();
  @override
  void initState() {
    if (PreferenceUtils.getUserId().isNotEmpty) {
      getMyWishListReqModel.userId = PreferenceUtils.getUserId();
      wishListViewModel.getMyWishlistViewModel(getMyWishListReqModel);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.lightWhiteBlueFF,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(15.w),
        child: widget.isBottomNavigation==true?commonAppbar(appbarTitle: VariableUtils.myWishList,leadingWidth: 0):commonAppbar(
            leadingIcon: IconUtils.backArrrow, onTap: () {
          /// Leading Icon OnTap
          Get.back();
        }, appbarTitle: VariableUtils.myWishList, centerTitle: false),
      ),
      body: WillPopScope(
        onWillPop: () {
          Get.offAll(SystemNavigator.pop());
          return Future.value(false);
        },

        child: Column(
          children: [

            PreferenceUtils.getUserId().isNotEmpty
                ? Expanded(
                    child: GetBuilder<WishListViewModel>(
                      builder: (myWishListController) {
                        if (myWishListController
                                .getWishListApiResponse.status ==
                            Status.LOADING) {
                          return Center(
                              child: const CircularProgressIndicator());
                        }
                        if (myWishListController
                                .getWishListApiResponse.status ==
                            Status.ERROR) {
                          const Text('error');
                        }

                        GetMyWishListResModel myWishListResponse =
                            myWishListController.getWishListApiResponse.data;
                        return ListView.builder(
                          itemCount: myWishListResponse.data!.length,
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
                                                  myWishListResponse
                                                      .data![index].img!),
                                              imageErrorBuilder:
                                                  (context, error, stack) {
                                                return SizedBox(
                                                  child: Image.asset(
                                                    "assets/icons/no-image-found.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              },
                                              image: NetworkImage(
                                                  myWishListResponse
                                                      .data![index].img!),
                                              height: 50.w,
                                              fit: BoxFit.fill,
                                              // height: 15.w,
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        myWishListResponse
                                                            .data![index]
                                                            .product!,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: FontTextStyle
                                                            .imageTitleDeliveryStyle,
                                                      ),
                                                    ),
                                                    InkWell(
                                                        onTap: () async {
                                                          removeWishlistReqModel
                                                                  .productId =
                                                              myWishListResponse
                                                                  .data![index]
                                                                  .productId;
                                                          removeWishlistReqModel
                                                                  .userId =
                                                              PreferenceUtils
                                                                  .getUserId();
                                                          await wishListViewModel
                                                              .removeWishlistViewModel(
                                                                  removeWishlistReqModel);
                                                          await wishListViewModel
                                                              .getMyWishlistViewModel(
                                                                  getMyWishListReqModel);
                                                        },
                                                        child: ImagesWidgets
                                                            .deleteDeliveryImage)
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                myWishListResponse
                                                    .data![index].price!,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: FontTextStyle
                                                    .imageAmountStyle,
                                              ),
                                              GetBuilder<CartViewModel>(
                                                builder: (addToCartController) {
                                                  if (addToCartController
                                                          .addToCartApiResponse
                                                          .status ==
                                                      Status.LOADING) {}
                                                  return InkWell(
                                                    onTap: () async {
                                                      if (PreferenceUtils
                                                              .getUserId()
                                                          .isNotEmpty) {
                                                        productAddToCartReqModel
                                                                .productId =
                                                            myWishListResponse
                                                                .data![index]
                                                                .productId!;
                                                        productAddToCartReqModel
                                                            .qty = "1";
                                                        productAddToCartReqModel
                                                                .userId =
                                                            PreferenceUtils
                                                                .getUserId();
                                                        await cartViewModel
                                                            .productAddToCartViewModel(
                                                                productAddToCartReqModel);

                                                        if (addToCartController
                                                                .addToCartApiResponse
                                                                .status ==
                                                            Status.COMPLETE) {
                                                          cartViewModel
                                                              .addToCartLocalData
                                                              .clear();
                                                        }
                                                        ProductAddToCartResModel
                                                            pAddResponse =
                                                            cartViewModel
                                                                .addToCartApiResponse
                                                                .data;
                                                        snackbar.customSnackBar(
                                                          context,
                                                          '${pAddResponse.msg}',
                                                          ColorUtils
                                                              .primaryColor,
                                                        );
                                                      } else {
                                                        final containPIndex = cartViewModel
                                                            .addToCartLocalData
                                                            .indexWhere((element) =>
                                                                element['id'] ==
                                                                myWishListResponse
                                                                    .data![
                                                                        index]
                                                                    .productId!);
                                                        if (containPIndex ==
                                                            -1) {
                                                          cartViewModel
                                                              .addToCartLocalData
                                                              .add({
                                                            "id":
                                                                myWishListResponse
                                                                    .data![
                                                                        index]
                                                                    .productId!,
                                                            "img":
                                                                myWishListResponse
                                                                    .data![
                                                                        index]
                                                                    .img,
                                                            "productName":
                                                                myWishListResponse
                                                                    .data![
                                                                        index]
                                                                    .product,
                                                            "price":
                                                                myWishListResponse
                                                                    .data![
                                                                        index]
                                                                    .price,
                                                            "qty":
                                                                int.parse("1")
                                                          });
                                                        } else {
                                                          cartViewModel
                                                                      .addToCartLocalData[
                                                                  containPIndex]
                                                              [
                                                              'qty'] = cartViewModel
                                                                          .addToCartLocalData[
                                                                      containPIndex]
                                                                  ['qty'] +
                                                              1;
                                                        }
                                                        snackbar.customSnackBar(
                                                          context,
                                                          '${"Product Added To Cart"}',
                                                          ColorUtils
                                                              .primaryColor,
                                                        );
                                                      }
                                                    },
                                                    child: Container(
                                                      height: 6.w,
                                                      width: 6.w,
                                                      decoration: DecorationUtils
                                                          .addButtonDecoration(),
                                                      child: IconUtils.add,
                                                    ),
                                                  );
                                                },
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
                  )
                : Expanded(
                    child: GetBuilder<WishListViewModel>(
                      builder: (myWishListController) {
                        return ListView.builder(
                          itemCount: myWishListController.wishListLocalData.keys
                              .toList()
                              .length,
                          itemBuilder: (context, index) {
                            final key = myWishListController
                                .wishListLocalData.keys
                                .toList()[index];
                            print('KEY:=>$key');
                            final data =
                                myWishListController.wishListLocalData[key];
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
                                              placeholder:
                                                  NetworkImage(data!['img']),
                                              imageErrorBuilder:
                                                  (context, error, stack) {
                                                return SizedBox(
                                                  child: Image.asset(
                                                    "assets/icons/no-image-found.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              },
                                              image: NetworkImage(data['img']),
                                              height: 50.w,
                                              fit: BoxFit.fill,
                                              // height: 15.w,
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        data['pName'],
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: FontTextStyle
                                                            .imageTitleDeliveryStyle,
                                                      ),
                                                    ),
                                                    InkWell(
                                                        onTap: () {},
                                                        child: ImagesWidgets
                                                            .deleteDeliveryImage)
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                data['price'],
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: FontTextStyle
                                                    .imageAmountStyle,
                                              ),
                                              GetBuilder<CartViewModel>(
                                                builder: (addToCartController) {
                                                  List wishListProductId = wishListViewModel
                                                      .wishListLocalData.values
                                                      .where((element) =>
                                                  element['isLike'] == true)
                                                      .toList()
                                                      .map((e) => e['id'])
                                                      .toList();
                                                  if (addToCartController
                                                      .addToCartApiResponse
                                                      .status ==
                                                      Status.LOADING) {}
                                                  return InkWell(
                                                    onTap: () async {
                                                      if (PreferenceUtils
                                                          .getUserId()
                                                          .isNotEmpty) {
                                                        productAddToCartReqModel
                                                            .productId =
                                                        wishListProductId[index];
                                                        log('i/////${wishListProductId[index]}');
                                                        productAddToCartReqModel
                                                            .qty = "1";
                                                        productAddToCartReqModel
                                                            .userId =
                                                            PreferenceUtils
                                                                .getUserId();
                                                        await cartViewModel
                                                            .productAddToCartViewModel(
                                                            productAddToCartReqModel);

                                                        if (addToCartController
                                                            .addToCartApiResponse
                                                            .status ==
                                                            Status.COMPLETE) {
                                                          cartViewModel
                                                              .addToCartLocalData
                                                              .clear();
                                                        }
                                                        ProductAddToCartResModel
                                                        pAddResponse =
                                                            cartViewModel
                                                                .addToCartApiResponse
                                                                .data;
                                                        snackbar.customSnackBar(
                                                          context,
                                                          '${pAddResponse.msg}',
                                                          ColorUtils
                                                              .primaryColor,
                                                        );
                                                      } else {
                                                        final containPIndex = cartViewModel
                                                            .addToCartLocalData
                                                            .indexWhere((element) =>
                                                        element['id'] ==
                                                            wishListProductId[index]);
                                                        if (containPIndex ==
                                                            -1) {
                                                          cartViewModel
                                                              .addToCartLocalData
                                                              .add({
                                                            "id":
                                                            wishListProductId[index],
                                                            "img":
                                                            data['img'],
                                                            "productName":
                                                            data['pName'],
                                                            "price":
                                                            data['price'],
                                                            "qty":
                                                            int.parse("1")
                                                          });
                                                        } else {
                                                          cartViewModel
                                                              .addToCartLocalData[
                                                          containPIndex]
                                                          [
                                                          'qty'] = cartViewModel
                                                              .addToCartLocalData[
                                                          containPIndex]
                                                          ['qty'] +
                                                              1;
                                                        }
                                                        snackbar.customSnackBar(
                                                          context,
                                                          '${"Product Added To Cart"}',
                                                          ColorUtils
                                                              .primaryColor,
                                                        );
                                                      }
                                                    },
                                                    child: Container(
                                                      height: 6.w,
                                                      width: 6.w,
                                                      decoration: DecorationUtils
                                                          .addButtonDecoration(),
                                                      child: IconUtils.add,
                                                    ),
                                                  );
                                                },
                                              )
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
                  )
          ],
        ),
      ),
    );
  }
}
