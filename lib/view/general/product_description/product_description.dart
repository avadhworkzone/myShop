import 'package:flutter/foundation.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:my_shop/modal/apiModel/request_model/add_to_cart_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/get_product_info_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/product_add_to_wishlist_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/remove_wishlist_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/get_product_info_res_model.dart';
import 'package:my_shop/view/login/signIn.dart';
import 'package:my_shop/viewModel/cart_view_model.dart';
import 'package:my_shop/viewModel/get_product_info_view_model.dart';
import 'package:my_shop/viewModel/wishlist_view_model.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../commanWidget/custom_snackbar.dart';
import '../../../controllers/delivery_controller.dart';
import '../../../modal/apiModel/request_model/get_product_list_req_model.dart';
import '../../../modal/apiModel/response_model/add_to_cart_res_model.dart';
import '../../../modal/apis/api_response.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/shared_preference_utils.dart';
import '../../../utils/variable_utils.dart';
import '../../../utils/decoration_utils.dart';
import '../../../utils/font_style_utils.dart';
import '../../../utils/size_config_utils.dart';
import '../../../commanWidget/custom_btn.dart';
import '../../../utils/assets/icons_utils.dart';
import '../../../utils/assets/images_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../viewModel/get_product_list_view_model.dart';
import '../bottombar_screens/card/shopping_cart.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../view/general/product_description/paymentMethod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ProductDescription extends StatefulWidget {
  ProductDescription({Key? key, this.productId}) : super(key: key);

  String? productId;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  CustomSnackbar snackbar = CustomSnackbar();
  GetProductListViewModel getProductListViewModel = Get.find();
  GetProductListReqModel getProductListReqModel = GetProductListReqModel();
  GetProductInfoViewModel getProductInfoViewModel = Get.find();
  CartViewModel cartViewModel = Get.find();
  ProductAddToCartReqModel productAddToCartReqModel =
      ProductAddToCartReqModel();
  GetProductInfoReqModel getProductInfoReqModel = GetProductInfoReqModel();
  DeliveryController deliveryController = Get.find();
  WishListViewModel wishListViewModel = Get.find();
  ProductAddToWishlistReqModel productAddToWishlistReqModel =
      ProductAddToWishlistReqModel();
  RemoveWishlistReqModel removeWishlistReqModel = RemoveWishlistReqModel();

  RxInt qnt = 0.obs;

  @override
  void initState() {
    getProductInfoReqModel.productId = widget.productId;
    getProductInfoViewModel.getProductInfoViewModel(getProductInfoReqModel);
    final containPIndex = cartViewModel.addToCartLocalData
        .indexWhere((element) => element['id'] == widget.productId);
    print('containPIndex:==>$containPIndex');
    if (containPIndex > -1) {
      qnt.value = cartViewModel.addToCartLocalData[containPIndex]['qty'];
    }
    print('containPIndex:==> QNT$qnt');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GetProductInfoViewModel>(
        builder: (getProductInfoController) {
          if (getProductInfoController.getProductInfoApiResponse.status ==
              Status.LOADING) {
            return const Center(child: CircularProgressIndicator());
          }
          if (getProductInfoController.getProductInfoApiResponse.status ==
              Status.ERROR) {
            Text('error');
          }
          GetProductInfoResModel response =
              getProductInfoController.getProductInfoApiResponse.data;
          return Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: 80.w,
                width: double.infinity,
                decoration: DecorationUtils.imagebackgroundDecoration(),
                child: Padding(
                  padding: EdgeInsets.only(top: 11.w, left: 3.w, right: 3.w),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: IconUtils.productBackArrow,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 50.w,
                            child: Text(
                              '${response.data![0].product}',
                              overflow: TextOverflow.ellipsis,
                              style: FontTextStyle.darkBrownJacketStyle,
                            ),
                          ),
                          // GetBuilder<WishListViewModel>(
                          //   builder: (wishlistController) {
                          //     return InkWell(
                          //         onTap: () async {
                          //           if (wishlistController.wishListLocalData
                          //               .containsKey(response.data![0].id)) {
                          //             wishlistController.wishListLocalData[
                          //                     response.data![0].id]!["isLike"] =
                          //                 !wishlistController.wishListLocalData[
                          //                     response.data![0].id]!["isLike"];
                          //           } else {
                          //             bool isLike =
                          //                 data.wishlist == "Yes" ? true : false;
                          //
                          //             wishlistController.wishListLocalData
                          //                 .addAll({
                          //               response.data![0].id!: {
                          //                 "pName": response.data![0].product,
                          //                 "id": response.data![0].id,
                          //                 "price": response.data![0].price,
                          //                 "img": response.data![0].img1,
                          //                 "isLike": !isLike
                          //               }
                          //             });
                          //           }
                          //           wishlistController.update();
                          //           print(
                          //               'IDS:=>${wishlistController.wishListLocalData.values.where((element) => element['isLike'] == true).toList().map((e) => e['id']).toList()}');
                          //
                          //           if (PreferenceUtils.getUserId()
                          //               .isNotEmpty) {
                          //             if (wishlistController.wishListLocalData
                          //                 .containsKey(response.data![0].id)) {
                          //               if (wishlistController
                          //                       .wishListLocalData[
                          //                   response.data![0].id]!["isLike"]) {
                          //                 productAddToWishlistReqModel
                          //                     .productId = response.data![0].id;
                          //                 productAddToWishlistReqModel.userId =
                          //                     PreferenceUtils.getUserId();
                          //                 await wishListViewModel
                          //                     .productAddToWishListViewModel(
                          //                         productAddToWishlistReqModel);
                          //               } else {
                          //                 removeWishlistReqModel.productId =
                          //                     data.id;
                          //                 removeWishlistReqModel.userId =
                          //                     PreferenceUtils.getUserId();
                          //                 await wishListViewModel
                          //                     .removeWishlistViewModel(
                          //                         removeWishlistReqModel);
                          //               }
                          //             } else {
                          //               bool isLike = data.wishlist == "Yes"
                          //                   ? true
                          //                   : false;
                          //               if (isLike == true) {
                          //                 removeWishlistReqModel.productId =
                          //                     response.data![0].id;
                          //                 removeWishlistReqModel.userId =
                          //                     PreferenceUtils.getUserId();
                          //                 await wishListViewModel
                          //                     .removeWishlistViewModel(
                          //                         removeWishlistReqModel);
                          //               } else {
                          //                 productAddToWishlistReqModel
                          //                     .productId = response.data![0].id;
                          //                 productAddToWishlistReqModel.userId =
                          //                     PreferenceUtils.getUserId();
                          //                 await wishListViewModel
                          //                     .productAddToWishListViewModel(
                          //                         productAddToWishlistReqModel);
                          //               }
                          //             }
                          //           }
                          //         },
                          //         child: wishlistController.wishListLocalData
                          //                 .containsKey(response.data![0].id)
                          //             ? wishlistController.wishListLocalData[
                          //                         response.data![0]
                          //                             .id]!["isLike"] ==
                          //                     true
                          //                 ? Icon(
                          //                     Icons.favorite,
                          //                     color: Colors.red,
                          //                     size: 5.w,
                          //                   )
                          //                 : Icon(
                          //                     Icons.favorite_border,
                          //                     color: ColorUtils.grey89,
                          //                     size: 5.w,
                          //                   )
                          //             : data.wishlist == "No"
                          //                 ? Icon(
                          //                     Icons.favorite_border,
                          //                     color: ColorUtils.grey89,
                          //                     size: 5.w,
                          //                   )
                          //                 : Icon(
                          //                     Icons.favorite,
                          //                     color: Colors.red,
                          //                     size: 5.w,
                          //                   )
                          //         // wishlistController
                          //         //         .wishlistData
                          //         //         .containsKey(
                          //         //             allNewArrivalProductResponse
                          //         //                 .data![
                          //         //                     index]
                          //         //                 .id)
                          //         //     ? wishlistController
                          //         //                     .wishlistData[
                          //         //                 allNewArrivalProductResponse
                          //         //                     .data![
                          //         //                         index]
                          //         //                     .id] ==
                          //         //             true
                          //         //         ? Icon(
                          //         //             Icons.favorite,
                          //         //             color:
                          //         //                 Colors.red,
                          //         //             size: 5.w,
                          //         //           )
                          //         //         : Icon(
                          //         //             Icons
                          //         //                 .favorite_border,
                          //         //             color:
                          //         //                 ColorUtils
                          //         //                     .grey89,
                          //         //             size: 5.w,
                          //         //           )
                          //         //     : allNewArrivalProductResponse
                          //         //                 .data![
                          //         //                     index]
                          //         //                 .wishlist ==
                          //         //             "No"
                          //         //         ? Icon(
                          //         //             Icons
                          //         //                 .favorite_border,
                          //         //             color:
                          //         //                 ColorUtils
                          //         //                     .grey89,
                          //         //             size: 5.w,
                          //         //           )
                          //         //         : Icon(
                          //         //             Icons.favorite,
                          //         //             color:
                          //         //                 Colors.red,
                          //         //             size: 5.w,
                          //         //           ),
                          //         );
                          //   },
                          // ),
                          Container(
                            padding: EdgeInsets.all(1.w),
                            decoration:
                                DecorationUtils.likeAndUnLikeDecoration(),
                            child: IconUtils.horizantalLike,
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            height: 60.w,
                            child: SizedBox(
                              child: CarouselSlider.builder(
                                itemCount:
                                    response.data![0].galleryImgs!.length,
                                itemBuilder: (context, index, realIndex) {
                                  return FadeInImage(
                                    placeholder: NetworkImage(
                                      response.data![0].galleryImgs![index],
                                    ),
                                    imageErrorBuilder: (context, error, stack) {
                                      return SizedBox(
                                        // width: 15.w,
                                        child: Image.asset(
                                          "assets/icons/no-image-found.png",
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                    image: NetworkImage(
                                        response.data![0].galleryImgs![index]),
                                    height: 50.w,
                                    fit: BoxFit.fill,
                                  );
                                },
                                options: CarouselOptions(
                                  height: 40.w,
                                  onPageChanged: (index, reason) =>
                                      productDescrController
                                          .currentIndexChange(index),
                                  enlargeCenterPage: true,
                                  aspectRatio: 7 / 1,
                                  viewportFraction: 0.8,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0.w,
                            top: 10.w,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: DecorationUtils.offerDecoration(),
                              child: Text(
                                '15%\n off',
                                style: FontTextStyle.offerTextStyle,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 2.w,
                            left: 41.w,
                            child: commonBuildIndicatorWidget(
                                count: response.data![0].galleryImgs!.length),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: ColorUtils.greyf3,
                        child: Container(
                          width: double.infinity,
                          decoration: DecorationUtils.containerDecoration(),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 6.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    VariableUtils.productDescriptionText,
                                    overflow: TextOverflow.ellipsis,
                                    style: FontTextStyle.productStyle,
                                  ),
                                ),
                                SizeConfig.sH1,
                                SizedBox(
                                  width: double.infinity,
                                  child: Html(data: response.data![0].descriptions!,)
                                  // HtmlWidget(
                                  //   response.data![0].descriptions!,
                                  //   textStyle: TextStyle(
                                  //     color: ColorUtils.greyA5,
                                  //     fontSize: 10.sp,
                                  //     fontWeight: FontWeightClass.bold,
                                  //   ),
                                  // ),
                                  // Text(
                                  //   response.data![0].descriptions!,
                                  //   overflow: TextOverflow.ellipsis,
                                  //   maxLines: 3,
                                  //   style:
                                  //       FontTextStyle.productDiscriptionStyle,
                                  // ),
                                ),
                                SizeConfig.sH1,
                                Row(
                                  children: [
                                    Text(
                                      '\$${response.data![0].mrp}',
                                      style: FontTextStyle.priceStyle,
                                    ),
                                    SizeConfig.sW1,
                                    Text(
                                      '- \$${response.data![0].price}',
                                      style: FontTextStyle.discountStyle,
                                    ),
                                  ],
                                ),
                                SizeConfig.sH1,
                                Obx(() => Row(
                                      children: [
                                        SmoothStarRating(
                                          rating: response.data![0].avgRating!,
                                          size: 3.h,
                                          starCount: 5,
                                          spacing: 0.5.w,
                                          filledIconData: Icons.star,
                                          halfFilledIconData: Icons.star_half,
                                          defaultIconData: Icons.star_border,
                                          allowHalfRating: true,
                                          color: ColorUtils.yellow41,
                                          borderColor: ColorUtils.greyE0,
                                          onRatingChanged: (value) =>
                                              productDescrController
                                                  .rating.value = value,
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            if (qnt.value > 1) {
                                              qnt.value -= 1;
                                            }
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(1.w),
                                            alignment: Alignment.center,
                                            decoration: DecorationUtils
                                                .orderCounterDecoration(),
                                            child: IconUtils.decrementIcon,
                                          ),
                                        ),
                                        SizeConfig.sW3,
                                        Text(
                                          qnt.value.toString(),
                                          style: FontTextStyle
                                              .oderStatusCounterStyle,
                                        ),
                                        SizeConfig.sW3,
                                        InkWell(
                                          onTap: () {
                                            qnt.value += 1;
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(1.w),
                                            alignment: Alignment.center,
                                            decoration: DecorationUtils
                                                .orderCounterDecoration(),
                                            child: Icon(
                                              Icons.add,
                                              size: 5.w,
                                              color: ColorUtils.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                SizeConfig.sH1,
                                Text(
                                  VariableUtils.additionalInformationText,
                                  style:
                                      FontTextStyle.additionalInformationStyle,
                                ),
                                SizeConfig.sH1,
                                // Html.fromDom(
                                //   document: dom.Document.html(
                                //       response.data![0].specification!),
                                //   shrinkWrap: true,
                                // ),
                                HtmlWidget(
                                  response.data![0].specification!,
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                // SingleChildScrollView(
                                //   scrollDirection: Axis.horizontal,
                                //   child: SizedBox(
                                //     width: Get.width,
                                //     child: Html(
                                //       data: response.data![0].specification!,
                                //       // shrinkWrap: true,
                                //
                                //     ),
                                //   ),
                                // ),
                                SizeConfig.sH1,
                                // Obx(
                                //   () => Column(
                                //     crossAxisAlignment:
                                //         CrossAxisAlignment.start,
                                //     children: [
                                //       productDescrController
                                //                   .readMoreText.value ==
                                //               false
                                //           ? const SizedBox()
                                //           : SizedBox(
                                //               width: 67.5.w,
                                //               child: Row(
                                //                 mainAxisAlignment:
                                //                     MainAxisAlignment
                                //                         .spaceBetween,
                                //                 children: [
                                //                   Column(
                                //                     crossAxisAlignment:
                                //                         CrossAxisAlignment
                                //                             .start,
                                //                     children: [
                                //                       Text(
                                //                         'Weight',
                                //                         style: FontTextStyle
                                //                             .additionalInformationDiscripationStyle,
                                //                       ),
                                //                       SizeConfig.sH1,
                                //                       Text(
                                //                         'Dimensions',
                                //                         style: FontTextStyle
                                //                             .additionalInformationDiscripationStyle,
                                //                       ),
                                //                     ],
                                //                   ),
                                //                   Column(
                                //                     crossAxisAlignment:
                                //                         CrossAxisAlignment
                                //                             .start,
                                //                     children: [
                                //                       Text(
                                //                         '1 kg',
                                //                         style: FontTextStyle
                                //                             .additionalInformationDiscripationStyle,
                                //                       ),
                                //                       SizeConfig.sH1,
                                //                       Text(
                                //                         '122 × 33 × 44 cm',
                                //                         style: FontTextStyle
                                //                             .additionalInformationDiscripationStyle,
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ],
                                //               ),
                                //             ),
                                //       InkWell(
                                //         onTap: () =>
                                //             productDescrController.readMore(),
                                //         child: Text(
                                //           productDescrController
                                //                       .readMoreText.value !=
                                //                   false
                                //               ? VariableUtils.lessText
                                //               : VariableUtils.readMoreText,
                                //           style:
                                //               FontTextStyle.lessReadMoreStyle,
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizeConfig.sH1,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  VariableUtils.youMayAlsoLikeText,
                                  style: FontTextStyle.youMayAlsoLikeStyle,
                                ),
                                CustomBtn(
                                  onTap: () {},
                                  bgColor: ColorUtils.lightPink63,
                                  height: 9.w,
                                  radius: 5.0,
                                  style: FontTextStyle.buttonTextColor,
                                  width: 23.w,
                                  title: VariableUtils.viewAllText,
                                ),
                              ],
                            ),
                            SizeConfig.sH2,
                            SizedBox(
                              height: 54.w,
                              child: ListView.builder(
                                itemCount: 5,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        width: 35.w,
                                        decoration: DecorationUtils
                                            .listviewDecoration(),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 30.w,
                                                alignment: Alignment.center,
                                                child:
                                                    ImagesWidgets.arrival3Image,
                                              ),
                                              SizeConfig.sH1,
                                              Text(
                                                'Man Casual Short',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: FontTextStyle
                                                    .discountRateStyle,
                                              ),
                                              SizeConfig.sH1,
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        '\$540.00',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: FontTextStyle
                                                            .discountRateStyle,
                                                      ),
                                                      Text(
                                                        '\$640.00',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: FontTextStyle
                                                            .strikeRateStyle,
                                                      ),
                                                    ],
                                                  ),
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      height: 6.w,
                                                      width: 6.w,
                                                      decoration: DecorationUtils
                                                          .addButtonDecoration(),
                                                      child: IconUtils.add,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 3.w,
                                        top: 0.5.w,
                                        child: IconUtils.heart,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Container(
                  height: 20.w,
                  decoration: DecorationUtils.buttonsBackGroundDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomBtn(
                        onTap: () async {
                          if (PreferenceUtils.getUserId().isNotEmpty) {
                            if (qnt.value == 0) {
                              snackbar.customSnackBar(
                                context,
                                'Increment The Quantity',
                                ColorUtils.primaryColor,
                              );
                            } else {
                              productAddToCartReqModel.productId =
                                  response.data![0].id!;
                              productAddToCartReqModel.qty =
                                  qnt.value.toString();
                              productAddToCartReqModel.userId =
                                  PreferenceUtils.getUserId();
                              await cartViewModel.productAddToCartViewModel(
                                  productAddToCartReqModel);
                              cartViewModel.addToCartLocalData.clear();
                              ProductAddToCartResModel pAddResponse =
                                  cartViewModel.addToCartApiResponse.data;
                              snackbar.customSnackBar(
                                context,
                                '${pAddResponse.msg}',
                                ColorUtils.primaryColor,
                              );
                              if (pAddResponse.status == "OK") {
                                Future.delayed(
                                  const Duration(seconds: 1),
                                  () {
                                    Get.to(ShoppingCart());
                                  },
                                );
                              }
                            }
                          } else {
                            if (qnt.value == 0) {
                              snackbar.customSnackBar(
                                context,
                                'Increment The Quantity',
                                ColorUtils.primaryColor,
                              );
                            } else {
                              final containPIndex = cartViewModel
                                  .addToCartLocalData
                                  .indexWhere((element) =>
                                      element['id'] == response.data![0].id);
                              print('poINDEX:=>$containPIndex');

                              if (containPIndex == -1) {
                                cartViewModel.addToCartLocalData.add({
                                  "id": response.data![0].id,
                                  "img": response.data![0].img1,
                                  "productName": response.data![0].product,
                                  "price": response.data![0].price,
                                  "qty": qnt.value
                                });
                              } else {
                                cartViewModel.addToCartLocalData[containPIndex]
                                    ['qty'] = qnt.value;
                              }
                              Future.delayed(
                                const Duration(seconds: 1),
                                () {
                                  Get.to(ShoppingCart());
                                },
                              );
                            }
                          }
                        },
                        bgColor: ColorUtils.grey8E,
                        height: 12.w,
                        radius: 5.0,
                        style: FontTextStyle.buttonTextColor,
                        width: 40.w,
                        title: VariableUtils.aDDToCartText,
                      ),
                      SizeConfig.sW1,
                      CustomBtn(
                        onTap: () {
                          PreferenceUtils.getLogin() == 0
                              ? Get.to(SignIn())
                              : Get.to(() => const PaymentMethod());
                        },
                        bgColor: ColorUtils.primaryColor,
                        height: 12.w,
                        radius: 5.0,
                        style: FontTextStyle.buttonTextColor,
                        width: 40.w,
                        title: VariableUtils.bUYNowText,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget commonBuildIndicatorWidget({int? count}) => Obx(
        () => AnimatedSmoothIndicator(
          activeIndex: productDescrController.currentIndictorDots.value,
          count: count!,
          effect: const ScrollingDotsEffect(
            spacing: 8.0,
            dotWidth: 7.0,
            dotHeight: 7.0,
            paintStyle: PaintingStyle.fill,
            strokeWidth: 4,
            dotColor: ColorUtils.greyB8,
            activeDotColor: ColorUtils.primaryColor,
          ),
        ),
      );

  ProductDescController productDescrController =
      Get.put(ProductDescController());
}

class ProductDescController extends GetxController {
  RxInt currentIndictorDots = RxInt(0);
  RxDouble rating = RxDouble(0.0);
  RxBool readMoreText = RxBool(false);
  RxBool viewdetailschek = RxBool(false);

  rattingChange(index) {
    rating.value = index;
  }

  readMore() {
    readMoreText.value = !readMoreText.value;
  }

  pastOrderChange() {
    viewdetailschek.value = !viewdetailschek.value;
  }

  currentIndexChange(index) {
    currentIndictorDots.value = index;
  }
}
