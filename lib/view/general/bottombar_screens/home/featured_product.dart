import 'dart:developer';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:my_shop/modal/apiModel/request_model/get_product_list_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/product_add_to_wishlist_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/remove_wishlist_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/get_product_list_res_model.dart';
import 'package:my_shop/utils/shared_preference_utils.dart';
import 'package:my_shop/viewModel/get_product_list_view_model.dart';
import 'package:my_shop/viewModel/wishlist_view_model.dart';
import 'package:sizer/sizer.dart';
import '../../../../commanWidget/common_appbar.dart';
import '../../../../modal/apis/api_response.dart';
import 'package:flutter/material.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/variable_utils.dart';
import '../../../../utils/decoration_utils.dart';
import '../../../../utils/font_style_utils.dart';
import '../../../../utils/size_config_utils.dart';
import '../../../../commanWidget/custom_btn.dart';
import '../../../../utils/assets/icons_utils.dart';
import '../../../../utils/assets/images_utils.dart';
import '../../product_description/product_description.dart';
import '../../../../controllers/featured_product_controller.dart';

class FeaturedProduct extends StatefulWidget {
  FeaturedProduct({Key? key, this.category_id, this.category_name})
      : super(key: key);

  String? category_id;
  String? category_name;

  @override
  State<FeaturedProduct> createState() => _FeaturedProductState();
}

class _FeaturedProductState extends State<FeaturedProduct> {
  GetProductListViewModel getProductListViewModel = Get.find();
  GetProductListReqModel getProductListReqModel = GetProductListReqModel();
  FeaturedProductController featuredProductController =
      Get.put(FeaturedProductController());
  WishListViewModel wishListViewModel = Get.find();
  ProductAddToWishlistReqModel productAddToWishlistReqModel =
      ProductAddToWishlistReqModel();
  RemoveWishlistReqModel removeWishlistReqModel = RemoveWishlistReqModel();

  @override
  void initState() {
    getProductListReqModel.categoryId = widget.category_id;
    getProductListViewModel.getProductListViewModel(getProductListReqModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(15.w),
        child: commonAppbar(leadingIcon: IconUtils.backArrrow, onTap: () {
          /// Leading Icon OnTap
          Get.back();
        }, appbarTitle: VariableUtils.featuredproductText, centerTitle: false),
      ),
      body: Column(
        children: [
          SizeConfig.sH2,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              children: [
                Text(
                  widget.category_name!,
                  style: FontTextStyle.fashionTextStyle,
                ),
                SizeConfig.sW2,
                const Spacer(),
                Obx(
                  () => InkWell(
                    onTap: () {
                      featuredProductController.slectedindex(false);
                    },
                    child: Image.asset(
                      "${imagesbasePath}vertical_icon.png",
                      fit: BoxFit.fill,
                      height: 7.w,
                      color: featuredProductController.selected.value == false
                          ? ColorUtils.red42
                          : ColorUtils.greyA5,
                    ),
                  ),
                ),
                SizeConfig.sW3,
                Obx(
                  () => InkWell(
                    onTap: () {
                      featuredProductController.selected.value = true;
                    },
                    child: Image.asset(
                      "${imagesbasePath}horizantal_icon.png",
                      fit: BoxFit.fill,
                      height: 7.w,
                      color: featuredProductController.selected.value == true
                          ? ColorUtils.red42
                          : ColorUtils.greyA5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizeConfig.sH2,
          Obx(
            () => Expanded(
              child: featuredProductController.selected.value == false
                  ? commonGridView(context)
                  : commonListView(context),
            ),
          ),
        ],
      ),
    );
  }

  commonGridView(context) {
    return GetBuilder<GetProductListViewModel>(
      builder: (getProductListController) {
        if (getProductListController.getProductListApiResponse.status ==
            Status.LOADING) {
          return const Center(child: CircularProgressIndicator());
        }
        if (getProductListController.getProductListApiResponse.status ==
            Status.ERROR) {
          Text('error');
        }
        GetProductListResModel response =
            getProductListController.getProductListApiResponse.data;
        return response.data!.isEmpty
            ? Center(child: Text('No Record Found'))
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 7,
                      crossAxisSpacing: 6,
                      childAspectRatio: 2 / 3),
                  scrollDirection: Axis.vertical,
                  itemCount: response.data!.length,
                  itemBuilder: (context, index) {
                    final data = response.data![index];
                    featuredProductController.likeUnlike.add(
                      Icon(
                        Icons.favorite_border,
                        size: 6.w,
                        color: ColorUtils.white,
                      ),
                    );
                    return Container(
                      padding: EdgeInsets.all(3.w),
                      decoration: DecorationUtils.borderSquareDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 50.w,
                                width: double.infinity,
                                decoration:
                                    DecorationUtils.imageBackgroundDecoration(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () =>
                                          Get.to(() => ProductDescription(
                                                productId:
                                                    response.data![index].id,
                                              )),
                                      child: FadeInImage(
                                        placeholder: NetworkImage(
                                          response.data![index].img1!,
                                        ),
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
                                        image: NetworkImage(
                                          response.data![index].img1!,
                                        ),
                                        height: 50.w,
                                        fit: BoxFit.fill,
                                        // height: 15.w,
                                      ),
                                      // Image.network(
                                      //   response.data![index].img1!,
                                      //   fit: BoxFit.fill,
                                      // ),
                                      // SizedBox(
                                      //   height: 35.w,
                                      //   child: newArrivalGridView[index]["images"],
                                      // ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  right: 0.5.w,
                                  top: 0.5.w,
                                  child: GetBuilder<WishListViewModel>(
                                    builder: (wishlistController) {
                                      return InkWell(
                                          onTap: () async {
                                            if (wishlistController
                                                .wishListLocalData
                                                .containsKey(data.id)) {
                                              wishlistController
                                                          .wishListLocalData[
                                                      data.id]!["isLike"] =
                                                  !wishlistController
                                                          .wishListLocalData[
                                                      data.id]!["isLike"];
                                            } else {
                                              bool isLike =
                                                  data.wishlist == "Yes"
                                                      ? true
                                                      : false;

                                              wishlistController
                                                  .wishListLocalData
                                                  .addAll({
                                                data.id!: {
                                                  "pName": data.product,
                                                  "id": data.id,
                                                  "price": data.price,
                                                  "img": data.img1,
                                                  "isLike": !isLike
                                                }
                                              });
                                            }
                                            wishlistController.update();
                                            print(
                                                'IDS:=>${wishlistController.wishListLocalData.values.where((element) => element['isLike'] == true).toList().map((e) => e['id']).toList()}');

                                            log('wishListLocalData${wishlistController.wishListLocalData}');
                                            if (PreferenceUtils.getUserId()
                                                .isNotEmpty) {
                                              if (wishlistController
                                                  .wishListLocalData
                                                  .containsKey(data.id)) {
                                                if (wishlistController
                                                        .wishListLocalData[
                                                    data.id]!["isLike"]) {
                                                  productAddToWishlistReqModel
                                                      .productId = data.id;
                                                  productAddToWishlistReqModel
                                                          .userId =
                                                      PreferenceUtils
                                                          .getUserId();
                                                  await wishListViewModel
                                                      .productAddToWishListViewModel(
                                                          productAddToWishlistReqModel);
                                                } else {
                                                  removeWishlistReqModel
                                                      .productId = data.id;
                                                  removeWishlistReqModel
                                                          .userId =
                                                      PreferenceUtils
                                                          .getUserId();
                                                  await wishListViewModel
                                                      .removeWishlistViewModel(
                                                          removeWishlistReqModel);
                                                }
                                              } else {
                                                bool isLike =
                                                    data.wishlist == "Yes"
                                                        ? true
                                                        : false;
                                                if (isLike == true) {
                                                  removeWishlistReqModel
                                                      .productId = data.id;
                                                  removeWishlistReqModel
                                                          .userId =
                                                      PreferenceUtils
                                                          .getUserId();
                                                  await wishListViewModel
                                                      .removeWishlistViewModel(
                                                          removeWishlistReqModel);
                                                } else {
                                                  productAddToWishlistReqModel
                                                      .productId = data.id;
                                                  productAddToWishlistReqModel
                                                          .userId =
                                                      PreferenceUtils
                                                          .getUserId();
                                                  await wishListViewModel
                                                      .productAddToWishListViewModel(
                                                          productAddToWishlistReqModel);
                                                }
                                              }
                                            }
                                          },
                                          child: wishlistController
                                                  .wishListLocalData
                                                  .containsKey(data.id)
                                              ? wishlistController
                                                              .wishListLocalData[
                                                          data.id]!["isLike"] ==
                                                      true
                                                  ? Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                      size: 5.w,
                                                    )
                                                  : Icon(
                                                      Icons.favorite_border,
                                                      color: ColorUtils.grey89,
                                                      size: 5.w,
                                                    )
                                              : data.wishlist == "No"
                                                  ? Icon(
                                                      Icons.favorite_border,
                                                      color: ColorUtils.grey89,
                                                      size: 5.w,
                                                    )
                                                  : Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                      size: 5.w,
                                                    )
                                          // wishlistController
                                          //         .wishlistData
                                          //         .containsKey(
                                          //             allNewArrivalProductResponse
                                          //                 .data![
                                          //                     index]
                                          //                 .id)
                                          //     ? wishlistController
                                          //                     .wishlistData[
                                          //                 allNewArrivalProductResponse
                                          //                     .data![
                                          //                         index]
                                          //                     .id] ==
                                          //             true
                                          //         ? Icon(
                                          //             Icons.favorite,
                                          //             color:
                                          //                 Colors.red,
                                          //             size: 5.w,
                                          //           )
                                          //         : Icon(
                                          //             Icons
                                          //                 .favorite_border,
                                          //             color:
                                          //                 ColorUtils
                                          //                     .grey89,
                                          //             size: 5.w,
                                          //           )
                                          //     : allNewArrivalProductResponse
                                          //                 .data![
                                          //                     index]
                                          //                 .wishlist ==
                                          //             "No"
                                          //         ? Icon(
                                          //             Icons
                                          //                 .favorite_border,
                                          //             color:
                                          //                 ColorUtils
                                          //                     .grey89,
                                          //             size: 5.w,
                                          //           )
                                          //         : Icon(
                                          //             Icons.favorite,
                                          //             color:
                                          //                 Colors.red,
                                          //             size: 5.w,
                                          //           ),
                                          );
                                    },
                                  )
                                  // InkWell(
                                  //   onTap: () => featuredProductController
                                  //       .likeChange(index),
                                  //   child: Container(
                                  //     padding: EdgeInsets.all(2.w),
                                  //     decoration: DecorationUtils
                                  //         .likeAndUnLikeDecoration(),
                                  //     child: featuredProductController
                                  //         .likeUnlike[index],
                                  //   ),
                                  // ),
                                  ),
                            ],
                          ),
                          SizeConfig.sH1,
                          InkWell(
                            onTap: () => Get.to(() => ProductDescription(
                                  // galleryImg: response.data![index].galleryImgs,
                                  // productName: response.data![index].product,
                                  productId: response.data![index].id,
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    // VariableUtils.darkBrownJacket,
                                    response.data![index].product!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style:
                                        FontTextStyle.darkBrownJacketTextStyle,
                                  ),
                                ),
                                SizeConfig.sH05,
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Text(
                                        response.data![index].mrp!,
                                        style: FontTextStyle
                                            .strickPriceFeatureStyle,
                                      ),
                                      SizeConfig.sW1,
                                      Text(
                                        '- \$${response.data![index].price!}',
                                        style: FontTextStyle
                                            .discountPriceFeatureStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
      },
    );
  }

  commonListView(context) {
    return GetBuilder<GetProductListViewModel>(
      builder: (getProductListController) {
        if (getProductListController.getProductListApiResponse.status ==
            Status.LOADING) {
          return Center(child: CircularProgressIndicator());
        }
        if (getProductListController.getProductListApiResponse.status ==
            Status.ERROR) {
          Text('error');
        }
        GetProductListResModel response =
            getProductListController.getProductListApiResponse.data;
        return ListView.builder(
          padding: const EdgeInsets.all(0.0),
          itemCount: response.data!.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final data = response.data![index];
            // featuredProductController.likeUnlike.add(
            //   Icon(
            //     Icons.favorite_border,
            //     size: 6.w,
            //     color: ColorUtils.white,
            //   ),
            // );
            return InkWell(
              onTap: () => Get.to(() => ProductDescription(
                    // galleryImg: response.data![index].galleryImgs,
                    // productName: response.data![index].product,
                    productId: response.data![index].id,
                  )),
              child: Padding(
                padding: EdgeInsets.all(3.w),
                child: Container(
                  padding: EdgeInsets.all(2.w),
                  // height: 20.w,
                  width: double.infinity,
                  decoration: DecorationUtils.borderSquareDecoration(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 37.w,
                            height: 45.w,
                            decoration:
                                DecorationUtils.imageDecorationDecoration(),
                            child: Container(
                              padding: EdgeInsets.all(4.w),
                              // child: ImagesWidgets.arrival3,
                              child: FadeInImage(
                                placeholder: NetworkImage(
                                  response.data![index].img1!,
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
                                  response.data![index].img1!,
                                ),
                                height: 50.w,
                                fit: BoxFit.fill,
                                // height: 15.w,
                              ),
                              // newArrivalListView[index]["images"],
                            ),
                          ),
                          SizeConfig.sW2,
                          Expanded(
                            child: SizedBox(
                              height: 45.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 50.w,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 41.w,
                                          child: Text(
                                            // VariableUtils.darkBrownJacket,
                                            response.data![index].categoryName!,
                                            overflow: TextOverflow.ellipsis,
                                            style: FontTextStyle
                                                .darkBrownJacketTextStyle
                                                .copyWith(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeightClass.bold,
                                            ),
                                          ),
                                        ),
                                        GetBuilder<WishListViewModel>(
                                          builder: (wishlistController) {
                                            return InkWell(
                                                onTap: () async {
                                                  if (wishlistController
                                                      .wishListLocalData
                                                      .containsKey(data.id)) {
                                                    wishlistController
                                                                .wishListLocalData[
                                                            data.id]!["isLike"] =
                                                        !wishlistController
                                                                .wishListLocalData[
                                                            data.id]!["isLike"];
                                                  } else {
                                                    bool isLike =
                                                        data.wishlist == "Yes"
                                                            ? true
                                                            : false;

                                                    wishlistController
                                                        .wishListLocalData
                                                        .addAll({
                                                      data.id!: {
                                                        "pName": data.product,
                                                        "id": data.id,
                                                        "price": data.price,
                                                        "img": data.img1,
                                                        "isLike": !isLike
                                                      }
                                                    });
                                                  }
                                                  wishlistController.update();
                                                  print(
                                                      'IDS:=>${wishlistController.wishListLocalData.values.where((element) => element['isLike'] == true).toList().map((e) => e['id']).toList()}');

                                                  log('wishListLocalData${wishlistController.wishListLocalData}');
                                                  if (PreferenceUtils.getUserId()
                                                      .isNotEmpty) {
                                                    if (wishlistController
                                                        .wishListLocalData
                                                        .containsKey(data.id)) {
                                                      if (wishlistController
                                                              .wishListLocalData[
                                                          data.id]!["isLike"]) {
                                                        productAddToWishlistReqModel
                                                            .productId = data.id;
                                                        productAddToWishlistReqModel
                                                                .userId =
                                                            PreferenceUtils
                                                                .getUserId();
                                                        await wishListViewModel
                                                            .productAddToWishListViewModel(
                                                                productAddToWishlistReqModel);
                                                      } else {
                                                        removeWishlistReqModel
                                                            .productId = data.id;
                                                        removeWishlistReqModel
                                                                .userId =
                                                            PreferenceUtils
                                                                .getUserId();
                                                        await wishListViewModel
                                                            .removeWishlistViewModel(
                                                                removeWishlistReqModel);
                                                      }
                                                    } else {
                                                      bool isLike =
                                                          data.wishlist == "Yes"
                                                              ? true
                                                              : false;
                                                      if (isLike == true) {
                                                        removeWishlistReqModel
                                                            .productId = data.id;
                                                        removeWishlistReqModel
                                                                .userId =
                                                            PreferenceUtils
                                                                .getUserId();
                                                        await wishListViewModel
                                                            .removeWishlistViewModel(
                                                                removeWishlistReqModel);
                                                      } else {
                                                        productAddToWishlistReqModel
                                                            .productId = data.id;
                                                        productAddToWishlistReqModel
                                                                .userId =
                                                            PreferenceUtils
                                                                .getUserId();
                                                        await wishListViewModel
                                                            .productAddToWishListViewModel(
                                                                productAddToWishlistReqModel);
                                                      }
                                                    }
                                                  }
                                                },
                                                child: wishlistController
                                                        .wishListLocalData
                                                        .containsKey(data.id)
                                                    ? wishlistController
                                                                    .wishListLocalData[
                                                                data.id]!["isLike"] ==
                                                            true
                                                        ? Icon(
                                                            Icons.favorite,
                                                            color: Colors.red,
                                                            size: 5.w,
                                                          )
                                                        : Icon(
                                                            Icons.favorite_border,
                                                            color:
                                                                ColorUtils.grey89,
                                                            size: 5.w,
                                                          )
                                                    : data.wishlist == "No"
                                                        ? Icon(
                                                            Icons.favorite_border,
                                                            color:
                                                                ColorUtils.grey89,
                                                            size: 5.w,
                                                          )
                                                        : Icon(
                                                            Icons.favorite,
                                                            color: Colors.red,
                                                            size: 5.w,
                                                          )
                                                // wishlistController
                                                //         .wishlistData
                                                //         .containsKey(
                                                //             allNewArrivalProductResponse
                                                //                 .data![
                                                //                     index]
                                                //                 .id)
                                                //     ? wishlistController
                                                //                     .wishlistData[
                                                //                 allNewArrivalProductResponse
                                                //                     .data![
                                                //                         index]
                                                //                     .id] ==
                                                //             true
                                                //         ? Icon(
                                                //             Icons.favorite,
                                                //             color:
                                                //                 Colors.red,
                                                //             size: 5.w,
                                                //           )
                                                //         : Icon(
                                                //             Icons
                                                //                 .favorite_border,
                                                //             color:
                                                //                 ColorUtils
                                                //                     .grey89,
                                                //             size: 5.w,
                                                //           )
                                                //     : allNewArrivalProductResponse
                                                //                 .data![
                                                //                     index]
                                                //                 .wishlist ==
                                                //             "No"
                                                //         ? Icon(
                                                //             Icons
                                                //                 .favorite_border,
                                                //             color:
                                                //                 ColorUtils
                                                //                     .grey89,
                                                //             size: 5.w,
                                                //           )
                                                //         : Icon(
                                                //             Icons.favorite,
                                                //             color:
                                                //                 Colors.red,
                                                //             size: 5.w,
                                                //           ),
                                                );
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  SizeConfig.sH1,
                                  Row(
                                    children: [
                                      Text(
                                        response.data![index].mrp!,
                                        style:
                                            FontTextStyle.strickPriceFeatureStyle,
                                      ),
                                      SizeConfig.sW1,
                                      Text(
                                        '- \$${response.data![index].price!}',
                                        style: FontTextStyle
                                            .discountPriceFeatureStyle,
                                      ),
                                    ],
                                  ),
                                  SizeConfig.sH1,
                              Flexible(
                                child: Html(
                                        data: response.data![0].descriptions!,
                                         shrinkWrap: true,

                                      ),
                              ),
                                  // Expanded(
                                  //   child: HtmlWidget(
                                  //
                                  //     response.data![0].descriptions!,
                                  //     textStyle: TextStyle(
                                  //       color: ColorUtils.greyA5,
                                  //       fontSize: 10.sp,
                                  //
                                  //       fontWeight: FontWeightClass.bold,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizeConfig.sH2,
                      CustomBtn(
                        onTap: () {
                          // Get.to(() => const ShoppingCart());
                        },
                        title: VariableUtils.selectOptionsText,
                        radius: 5.0,
                        bgColor: ColorUtils.pink69,
                        style: FontTextStyle.featuredButtonStyle,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
