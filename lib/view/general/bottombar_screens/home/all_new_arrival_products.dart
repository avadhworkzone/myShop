import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_shop/modal/apiModel/response_model/get_all_product_list_res_model.dart';
import 'package:sizer/sizer.dart';
import '../../../../commanWidget/common_appbar.dart';
import '../../../../modal/apiModel/request_model/product_add_to_wishlist_req_model.dart';
import '../../../../modal/apiModel/request_model/remove_wishlist_req_model.dart';
import '../../../../modal/apis/api_response.dart';
import '../../../../utils/assets/icons_utils.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/decoration_utils.dart';
import '../../../../utils/font_style_utils.dart';
import '../../../../utils/shared_preference_utils.dart';
import '../../../../utils/size_config_utils.dart';
import '../../../../utils/variable_utils.dart';
import '../../../../viewModel/get_all_product_list_view_model.dart';
import '../../../../viewModel/wishlist_view_model.dart';
import '../../product_description/product_description.dart';
import '../bottombar_screen.dart';

class AllNewArrivalProducts extends StatefulWidget {
  const AllNewArrivalProducts({Key? key}) : super(key: key);

  @override
  State<AllNewArrivalProducts> createState() => _AllNewArrivalProductsState();
}

class _AllNewArrivalProductsState extends State<AllNewArrivalProducts> {
  GetAllProductListAndCategoryListViewModel
      getAllProductListAndCategoryListViewModel = Get.find();

  ProductAddToWishlistReqModel productAddToWishlistReqModel =
      ProductAddToWishlistReqModel();
  WishListViewModel wishListViewModel = Get.find();
  RemoveWishlistReqModel removeWishlistReqModel = RemoveWishlistReqModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(15.w),
        child: commonAppbar(leadingIcon: IconUtils.backArrrow, onTap: () {
          /// Leading Icon OnTap
         Get.back();
        }, appbarTitle: VariableUtils.allNewArrival, centerTitle: false),
      ),
      body: Column(
        children: [
          GetBuilder<GetAllProductListAndCategoryListViewModel>(
            builder: (getAllNewArrivalListController) {
              if (getAllNewArrivalListController
                      .getAllNewArrivalProductListApiResponse.status ==
                  Status.LOADING) {
                return const Center(child: CircularProgressIndicator());
              }
              if (getAllNewArrivalListController
                      .getAllNewArrivalProductListApiResponse.status ==
                  Status.ERROR) {
                const Text('error');
              }
              GetAllProductListResModel allProductResponse =
                  getAllNewArrivalListController
                      .getAllNewArrivalProductListApiResponse.data;

              return Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(0.w),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 7,
                      childAspectRatio: 1.3 / 2,
                      crossAxisSpacing: 7),
                  scrollDirection: Axis.vertical,
                  // shrinkWrap: true,
                  itemCount: allProductResponse.data!.length,
                  itemBuilder: (context, index) {
                    final data = allProductResponse.data![index];
                    return InkWell(
                      onTap: () {
                        Get.to(ProductDescription(
                            productId: allProductResponse.data![index].id));
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 35.w,
                            decoration: DecorationUtils.listviewDecoration(),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.w, vertical: 1.w),
                                    child: FadeInImage(
                                      placeholder: NetworkImage(
                                        allProductResponse.data![index].img1!,
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
                                        allProductResponse.data![index].img1!,
                                      ),
                                      fit: BoxFit.fill,
                                      // height: 15.w,
                                    ),
                                    // Image.network(
                                    //   response.data![index].img1!,
                                    //   fit: BoxFit.fill,
                                    // ),
                                  ),
                                  SizeConfig.sH1,
                                  Text(
                                    allProductResponse.data![index].product!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: FontTextStyle.discountRateStyle,
                                  ),
                                  SizeConfig.sH1,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            allProductResponse
                                                .data![index].price!,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style:
                                                FontTextStyle.discountRateStyle,
                                          ),
                                          Text(
                                            allProductResponse
                                                .data![index].mrp!,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style:
                                                FontTextStyle.strikeRateStyle,
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
                            child: GetBuilder<WishListViewModel>(
                              builder: (wishlistController) {
                                return InkWell(
                                    onTap: () async {
                                      if (wishlistController.wishListLocalData
                                          .containsKey(data.id)) {
                                        wishlistController.wishListLocalData[
                                                data.id]!["isLike"] =
                                            !wishlistController
                                                    .wishListLocalData[
                                                data.id]!["isLike"];
                                      } else {
                                        bool isLike = data.wishlist == "Yes"
                                            ? true
                                            : false;

                                        wishlistController.wishListLocalData
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
                                        if (wishlistController.wishListLocalData
                                            .containsKey(data.id)) {
                                          if (wishlistController
                                                  .wishListLocalData[data.id]![
                                              "isLike"]) {
                                            productAddToWishlistReqModel
                                                .productId = data.id;
                                            productAddToWishlistReqModel
                                                    .userId =
                                                PreferenceUtils.getUserId();
                                            await wishListViewModel
                                                .productAddToWishListViewModel(
                                                    productAddToWishlistReqModel);
                                          } else {
                                            removeWishlistReqModel.productId =
                                                data.id;
                                            removeWishlistReqModel.userId =
                                                PreferenceUtils.getUserId();
                                            await wishListViewModel
                                                .removeWishlistViewModel(
                                                    removeWishlistReqModel);
                                          }
                                        } else {
                                          bool isLike = data.wishlist == "Yes"
                                              ? true
                                              : false;
                                          if (isLike == true) {
                                            removeWishlistReqModel.productId =
                                                data.id;
                                            removeWishlistReqModel.userId =
                                                PreferenceUtils.getUserId();
                                            await wishListViewModel
                                                .removeWishlistViewModel(
                                                    removeWishlistReqModel);
                                          } else {
                                            productAddToWishlistReqModel
                                                .productId = data.id;
                                            productAddToWishlistReqModel
                                                    .userId =
                                                PreferenceUtils.getUserId();
                                            await wishListViewModel
                                                .productAddToWishListViewModel(
                                                    productAddToWishlistReqModel);
                                          }
                                        }
                                      }
                                    },
                                    child: wishlistController.wishListLocalData
                                            .containsKey(data.id)
                                        ? wishlistController.wishListLocalData[
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
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
