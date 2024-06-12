import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:my_shop/commanWidget/custom_snackbar.dart';
import 'package:my_shop/modal/apiModel/request_model/get_all_product_list_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/get_category_list_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/get_shop_info_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/product_add_to_wishlist_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/remove_wishlist_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/add_to_cart_res_model.dart';
import 'package:my_shop/modal/apiModel/response_model/get_all_product_list_res_model.dart';
import 'package:my_shop/modal/apiModel/response_model/get_category_list_res_model.dart';
import 'package:my_shop/modal/apiModel/response_model/get_shop_info_res_model.dart';
import 'package:my_shop/modal/apis/api_response.dart';
import 'package:my_shop/view/general/bottombar_screens/home/all_new_arrival_products.dart';
import 'package:my_shop/view/general/product_description/product_description.dart';
import 'package:my_shop/viewModel/get_all_product_list_view_model.dart';
import '../../../../modal/apiModel/request_model/add_to_cart_req_model.dart';
import '../../../../utils/shared_preference_utils.dart';
import '../../../../viewModel/cart_view_model.dart';
import '../../../../viewModel/wishlist_view_model.dart';
import 'all_Categories.dart';
import 'package:get/get.dart';
import 'all_today_offer_products.dart';
import 'featured_product.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/typedef_utils.dart';
import '../../../../utils/variable_utils.dart';
import '../../../../utils/font_style_utils.dart';
import '../../../../utils/decoration_utils.dart';
import '../../../../utils/size_config_utils.dart';
import '../../../../commanWidget/custom_btn.dart';
import '../../../../utils/assets/icons_utils.dart';
import '../../../../utils/assets/images_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GetAllProductListAndCategoryListViewModel
      getAllProductListAndCategoryListViewModel = Get.find();

  WishListViewModel wishListViewModel = Get.find();
  RemoveWishlistReqModel removeWishlistReqModel = RemoveWishlistReqModel();

  GetCategoryListReqModel getCategoryListReqModel = GetCategoryListReqModel();
  ProductAddToWishlistReqModel productAddToWishlistReqModel =
      ProductAddToWishlistReqModel();

  GetAllProductListReqModel getAllProductListReqModel =
      GetAllProductListReqModel();

  CartViewModel cartViewModel = Get.find();
  ProductAddToCartReqModel productAddToCartReqModel =
      ProductAddToCartReqModel();

  GetShopInfoReqModel getShopInfoReqModel = GetShopInfoReqModel();
  CustomSnackbar snackbar = CustomSnackbar();

  @override
  void initState() {
    getAllProductListAndCategoryListViewModel
        .getCategoryListViewModel(getCategoryListReqModel);
    getShopInfo();
    newArrivalData();
    todayOfferData();
    super.initState();
  }

  Future getShopInfo() async {
    await getAllProductListAndCategoryListViewModel
        .getProductListViewModel(getShopInfoReqModel);
  }

  Future newArrivalData() async {
    getAllProductListReqModel.userId = PreferenceUtils.getUserId();
    getAllProductListReqModel.type = "New Arrival";
    getAllProductListReqModel.orderBy = "price_low";
    await getAllProductListAndCategoryListViewModel
        .getAllNewArrivalProductListViewModel(getAllProductListReqModel);
  }

  Future todayOfferData() async {
    getAllProductListReqModel.userId = PreferenceUtils.getUserId();
    getAllProductListReqModel.type = "Today Offer";
    getAllProductListReqModel.orderBy = "price_low";
    await getAllProductListAndCategoryListViewModel
        .getAllTodayOfferProductListViewModel(getAllProductListReqModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const MyDrawer(),
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(15.w),
      //     ),
      body: SingleChildScrollView(
        child: GetBuilder<GetAllProductListAndCategoryListViewModel>(
          builder: (getAllProductListCategoryListController) {
            if (getAllProductListCategoryListController
                        .getAllNewArrivalProductListApiResponse.status ==
                    Status.LOADING ||
                getAllProductListCategoryListController
                        .getCategoryListApiResponse.status ==
                    Status.LOADING ||
                getAllProductListCategoryListController
                        .getAllTodayOfferProductListApiResponse.status ==
                    Status.LOADING ||
                getAllProductListCategoryListController
                        .getShopInfoApiResponse.status ==
                    Status.LOADING) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 80.w),
                child: const CircularProgressIndicator(),
              );
            }
            if (getAllProductListCategoryListController
                    .getAllNewArrivalProductListApiResponse.status ==
                Status.ERROR) {
              const Text('error');
            }
            GetAllProductListResModel allNewArrivalProductResponse =
                getAllProductListCategoryListController
                    .getAllNewArrivalProductListApiResponse.data;

            GetShopInfoResModel shopInfoResponse =
                getAllProductListCategoryListController
                    .getShopInfoApiResponse.data;
            return SafeArea(
              child: Column(
                children: [
                  Container(
                    color: ColorUtils.primaryColor,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 1.5.w,vertical: 1.5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            shopInfoResponse.data![0].shopLogo!,
                            height: 10.w,
                          ),
                          IconsWidgets.notificationIconImage
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.w),
                    child: SizedBox(
                      // height: 70.w,
                      child: CarouselSlider.builder(
                        itemCount: shopInfoResponse.data![0].bannerImgs!.length,
                        itemBuilder: (context, index, realIndex) {
                          return Image.network(
                            shopInfoResponse.data![0].bannerImgs![index],
                            fit: BoxFit.fill,
                          );
                        },
                        options: CarouselOptions(
                          height: 40.w,
                          enlargeCenterPage: true,
                          // autoPlay: true,
                          aspectRatio: 7 / 1,
                          // autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                          // autoPlayAnimationDuration: Duration(milliseconds: 700),
                          viewportFraction: 0.8,
                        ),
                      ),
                    ),
                  ),
                  SizeConfig.sH2,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Column(
                      children: [
                        customRepeatTextAndButton(
                          VariableUtils.categoriesText,
                          VariableUtils.viewAllText,
                          () {
                            // Get.to(
                            //   BottomScreen(),
                            //   arguments: 'categoriesBtn',
                            // );
                            Get.to(() => AllCategories());
                          },
                        ),
                        SizeConfig.sH2,
                        GetBuilder<GetAllProductListAndCategoryListViewModel>(
                          builder: (getCategoryListController) {
                            // if (getCategoryListController
                            //     .getCategoryListApiResponse.status ==
                            //     Status.LOADING) {
                            //   return CircularProgressIndicator();
                            // }
                            if (getCategoryListController
                                    .getCategoryListApiResponse.status ==
                                Status.ERROR) {
                              Text('error');
                            }
                            GetCategoryListResModel response =
                                getCategoryListController
                                    .getCategoryListApiResponse.data;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                  4,
                                  (index) => InkWell(
                                        onTap: () {
                                          Get.to(() => FeaturedProduct(
                                                category_id:
                                                    response.data![index].id,
                                                category_name:
                                                    response.data![index].name,
                                              ));
                                        },
                                        child: Container(
                                          height: 26.w,
                                          width: 21.w,
                                          // height: 25.w,
                                          // width: 21.w,
                                          decoration: BoxDecoration(
                                            color: ColorUtils.white,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: FadeInImage(
                                                  placeholder: NetworkImage(
                                                    response
                                                        .data![index].image!,
                                                  ),
                                                  imageErrorBuilder:
                                                      (context, error, stack) {
                                                    return SizedBox(
                                                      width: 15.w,
                                                      child: Image.asset(
                                                        "assets/icons/no-image-found.png",
                                                        fit: BoxFit.cover,
                                                      ),
                                                    );
                                                  },
                                                  image: NetworkImage(
                                                    response
                                                        .data![index].image!,
                                                  ),
                                                  fit: BoxFit.cover,
                                                  height: 15.w,
                                                ),
                                              ),
                                              SizeConfig.sH2,
                                              Text(
                                                response.data![index].name!,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: FontTextStyle
                                                    .categoriesStyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                            );
                          },
                        ),
                        Column(
                          children: [
                            SizeConfig.sH2,
                            customRepeatTextAndButton(
                                VariableUtils.newarrivalText,
                                VariableUtils.viewAllText, () {
                              Get.to(() => AllNewArrivalProducts());
                              // Get.to(BottomScreen(), arguments: 'newArrivalBtn');

                              // Get.to(() => const FeaturedProduct());
                            }),
                            SizeConfig.sH2,
                            SizedBox(
                              height: 54.w,
                              child: ListView.builder(
                                itemCount: 5,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final newArrivalData =
                                      allNewArrivalProductResponse.data![index];
                                  return InkWell(
                                    onTap: () {
                                      Get.to(ProductDescription(
                                          productId: newArrivalData.id));
                                    },
                                    child: Stack(
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
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 2.w,
                                                      vertical: 1.w),
                                                  child: FadeInImage(
                                                    placeholder: NetworkImage(
                                                      newArrivalData.img1!,
                                                    ),
                                                    imageErrorBuilder: (context,
                                                        error, stack) {
                                                      return SizedBox(
                                                        // width: 15.w,
                                                        child: Image.asset(
                                                          "assets/icons/no-image-found.png",
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    },
                                                    image: NetworkImage(
                                                      newArrivalData.img1!,
                                                    ),
                                                    fit: BoxFit.fill,
                                                    // height: 15.w,
                                                  ),
                                                ),
                                                SizeConfig.sH1,
                                                Text(
                                                  newArrivalData.product!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                                          newArrivalData.price!,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                          style: FontTextStyle
                                                              .discountRateStyle,
                                                        ),
                                                        Text(
                                                          newArrivalData.mrp!,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                          style: FontTextStyle
                                                              .strikeRateStyle,
                                                        ),
                                                      ],
                                                    ),
                                                    GetBuilder<CartViewModel>(
                                                      builder:
                                                          (addToCartController) {
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
                                                                  newArrivalData
                                                                      .id!;
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
                                                                  Status
                                                                      .COMPLETE) {
                                                                cartViewModel
                                                                    .addToCartLocalData
                                                                    .clear();
                                                              }
                                                              ProductAddToCartResModel
                                                                  pAddResponse =
                                                                  cartViewModel
                                                                      .addToCartApiResponse
                                                                      .data;
                                                              snackbar
                                                                  .customSnackBar(
                                                                context,
                                                                '${pAddResponse.msg}',
                                                                ColorUtils
                                                                    .primaryColor,
                                                              );
                                                            } else {
                                                              final containPIndex = cartViewModel
                                                                  .addToCartLocalData
                                                                  .indexWhere((element) =>
                                                                      element[
                                                                          'id'] ==
                                                                      newArrivalData
                                                                          .id);
                                                              if (containPIndex ==
                                                                  -1) {
                                                                cartViewModel
                                                                    .addToCartLocalData
                                                                    .add({
                                                                  "id":
                                                                      newArrivalData
                                                                          .id,
                                                                  "img":
                                                                      newArrivalData
                                                                          .img1,
                                                                  "productName":
                                                                      newArrivalData
                                                                          .product,
                                                                  "price":
                                                                      newArrivalData
                                                                          .price,
                                                                  "qty":
                                                                      int.parse(
                                                                          "1")
                                                                });
                                                              } else {
                                                                cartViewModel
                                                                            .addToCartLocalData[
                                                                        containPIndex]
                                                                    [
                                                                    'qty'] = cartViewModel
                                                                            .addToCartLocalData[containPIndex]
                                                                        [
                                                                        'qty'] +
                                                                    1;
                                                              }
                                                              snackbar
                                                                  .customSnackBar(
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
                                                            decoration:
                                                                DecorationUtils
                                                                    .addButtonDecoration(),
                                                            child:
                                                                IconUtils.add,
                                                          ),
                                                        );
                                                      },
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
                                            child:
                                                GetBuilder<WishListViewModel>(
                                              builder:
                                                  (wishlistDataController) {
                                                return InkWell(
                                                  onTap: () async {
                                                    if (wishlistDataController
                                                        .wishListLocalData
                                                        .containsKey(
                                                            newArrivalData
                                                                .id)) {
                                                      wishlistDataController
                                                                  .wishListLocalData[
                                                              newArrivalData
                                                                  .id]!["isLike"] =
                                                          !wishlistDataController
                                                                  .wishListLocalData[
                                                              newArrivalData
                                                                  .id]!["isLike"];
                                                    } else {
                                                      bool isLike = newArrivalData
                                                                  .wishlist ==
                                                              "Yes"
                                                          ? true
                                                          : false;
                                                      wishlistDataController
                                                          .wishListLocalData
                                                          .addAll({
                                                        newArrivalData.id!: {
                                                          "pName":
                                                              newArrivalData
                                                                  .product,
                                                          "id":
                                                              newArrivalData.id,
                                                          "price":
                                                              newArrivalData
                                                                  .price,
                                                          "img": newArrivalData
                                                              .img1,
                                                          "isLike": !isLike
                                                        }
                                                      });
                                                    }
                                                    wishlistDataController
                                                        .update();
                                                    if (PreferenceUtils
                                                            .getUserId()
                                                        .isNotEmpty) {
                                                      if (wishlistDataController
                                                          .wishListLocalData
                                                          .containsKey(
                                                              newArrivalData
                                                                  .id)) {
                                                        if (wishlistDataController
                                                                .wishListLocalData[
                                                            newArrivalData
                                                                .id]!["isLike"]) {
                                                          productAddToWishlistReqModel
                                                                  .productId =
                                                              newArrivalData.id;
                                                          productAddToWishlistReqModel
                                                                  .userId =
                                                              PreferenceUtils
                                                                  .getUserId();
                                                          await wishListViewModel
                                                              .productAddToWishListViewModel(
                                                                  productAddToWishlistReqModel);
                                                        } else {
                                                          removeWishlistReqModel
                                                                  .productId =
                                                              newArrivalData.id;
                                                          removeWishlistReqModel
                                                                  .userId =
                                                              PreferenceUtils
                                                                  .getUserId();
                                                          await wishListViewModel
                                                              .removeWishlistViewModel(
                                                                  removeWishlistReqModel);
                                                        }
                                                      } else {
                                                        bool isLike = newArrivalData
                                                                    .wishlist ==
                                                                "Yes"
                                                            ? true
                                                            : false;
                                                        if (isLike == true) {
                                                          removeWishlistReqModel
                                                                  .productId =
                                                              newArrivalData.id;
                                                          removeWishlistReqModel
                                                                  .userId =
                                                              PreferenceUtils
                                                                  .getUserId();
                                                          await wishListViewModel
                                                              .removeWishlistViewModel(
                                                                  removeWishlistReqModel);
                                                        } else {
                                                          productAddToWishlistReqModel
                                                                  .productId =
                                                              newArrivalData.id;
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
                                                  child: wishlistDataController
                                                          .wishListLocalData
                                                          .containsKey(
                                                              newArrivalData.id)
                                                      ? wishlistDataController
                                                                          .wishListLocalData[
                                                                      newArrivalData
                                                                          .id]![
                                                                  "isLike"] ==
                                                              true
                                                          ? Icon(
                                                              Icons.favorite,
                                                              color: Colors.red,
                                                              size: 5.w,
                                                            )
                                                          : Icon(
                                                              Icons
                                                                  .favorite_border,
                                                              color: ColorUtils
                                                                  .grey89,
                                                              size: 5.w,
                                                            )
                                                      : newArrivalData
                                                                  .wishlist ==
                                                              "No"
                                                          ? Icon(
                                                              Icons
                                                                  .favorite_border,
                                                              color: ColorUtils
                                                                  .grey89,
                                                              size: 5.w,
                                                            )
                                                          : Icon(
                                                              Icons.favorite,
                                                              color: Colors.red,
                                                              size: 5.w,
                                                            ),
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
                                            )),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizeConfig.sH2,
                            customRepeatTextAndButton(VariableUtils.todaysOffer,
                                VariableUtils.viewAllText, () {
                              Get.to(() => AllTodayOfferProducts());
                              // Get.to(BottomScreen(), arguments: 'todayOffers');
                              // Get.to(() => ProductDescription());
                            }),
                            SizeConfig.sH2,
                            SizedBox(
                              height: 54.w, // 45.w
                              child: GetBuilder<
                                  GetAllProductListAndCategoryListViewModel>(
                                builder: (getTodayOfferDataController) {
                                  if (getTodayOfferDataController
                                          .getAllTodayOfferProductListApiResponse
                                          .status ==
                                      Status.ERROR) {
                                    Text('error');
                                  }
                                  GetAllProductListResModel
                                      todayOfferDataResponse =
                                      getTodayOfferDataController
                                          .getAllTodayOfferProductListApiResponse
                                          .data;
                                  return ListView.builder(
                                    itemCount: 5,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      final todayOfferData =
                                          todayOfferDataResponse.data![index];
                                      return InkWell(
                                        onTap: () {
                                          Get.to(ProductDescription(
                                              productId: todayOfferData.id));
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 2.w),
                                              width: 35.w,
                                              decoration: DecorationUtils
                                                  .listviewDecoration(),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 30.w,
                                                      alignment:
                                                          Alignment.center,
                                                      // child: ImagesWidgets.arrival3,
                                                      child: Image.network(
                                                          todayOfferData.img1!),
                                                    ),
                                                    SizeConfig.sH1,
                                                    Text(
                                                      // 'Man Casual Short',
                                                      todayOfferData.product!,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                                              '\$${todayOfferData.price}',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                              style: FontTextStyle
                                                                  .discountRateStyle,
                                                            ),
                                                            Text(
                                                              '\$${todayOfferData.mrp}',
                                                              overflow:
                                                                  TextOverflow
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
                                                            decoration:
                                                                DecorationUtils
                                                                    .addButtonDecoration(),
                                                            child:
                                                                IconUtils.add,
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
                                              child:
                                                  GetBuilder<WishListViewModel>(
                                                builder: (wishlistController) {
                                                  return InkWell(
                                                      onTap: () async {
                                                        if (wishlistController
                                                            .wishListLocalData
                                                            .containsKey(
                                                                todayOfferData
                                                                    .id)) {
                                                          wishlistController
                                                                      .wishListLocalData[
                                                                  todayOfferData
                                                                      .id]![
                                                              "isLike"] = !wishlistController
                                                                  .wishListLocalData[
                                                              todayOfferData
                                                                  .id]!["isLike"];
                                                        } else {
                                                          bool isLike =
                                                              todayOfferData
                                                                          .wishlist ==
                                                                      "Yes"
                                                                  ? true
                                                                  : false;

                                                          wishlistController
                                                              .wishListLocalData
                                                              .addAll({
                                                            todayOfferData.id!:
                                                                {
                                                              "pName":
                                                                  todayOfferData
                                                                      .product,
                                                              "id":
                                                                  todayOfferData
                                                                      .id,
                                                              "price":
                                                                  todayOfferData
                                                                      .price,
                                                              "img":
                                                                  todayOfferData
                                                                      .img1,
                                                              "isLike": !isLike
                                                            }
                                                          });
                                                        }
                                                        wishlistController
                                                            .update();
                                                        print(
                                                            'IDS:=>${wishlistController.wishListLocalData.values.where((element) => element['isLike'] == true).toList().map((e) => e['id']).toList()}');

                                                        log('wishListLocalData${wishlistController.wishListLocalData}');
                                                        if (PreferenceUtils
                                                                .getUserId()
                                                            .isNotEmpty) {
                                                          if (wishlistController
                                                              .wishListLocalData
                                                              .containsKey(
                                                                  todayOfferData
                                                                      .id)) {
                                                            if (wishlistController
                                                                    .wishListLocalData[
                                                                todayOfferData
                                                                    .id]!["isLike"]) {
                                                              productAddToWishlistReqModel
                                                                      .productId =
                                                                  todayOfferData
                                                                      .id;
                                                              productAddToWishlistReqModel
                                                                      .userId =
                                                                  PreferenceUtils
                                                                      .getUserId();
                                                              await wishListViewModel
                                                                  .productAddToWishListViewModel(
                                                                      productAddToWishlistReqModel);
                                                            } else {
                                                              removeWishlistReqModel
                                                                      .productId =
                                                                  todayOfferData
                                                                      .id;
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
                                                                todayOfferData
                                                                            .wishlist ==
                                                                        "Yes"
                                                                    ? true
                                                                    : false;
                                                            if (isLike ==
                                                                true) {
                                                              removeWishlistReqModel
                                                                      .productId =
                                                                  todayOfferData
                                                                      .id;
                                                              removeWishlistReqModel
                                                                      .userId =
                                                                  PreferenceUtils
                                                                      .getUserId();
                                                              await wishListViewModel
                                                                  .removeWishlistViewModel(
                                                                      removeWishlistReqModel);
                                                            } else {
                                                              productAddToWishlistReqModel
                                                                      .productId =
                                                                  todayOfferData
                                                                      .id;
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
                                                              .containsKey(
                                                                  todayOfferData
                                                                      .id)
                                                          ? wishlistController.wishListLocalData[
                                                                          todayOfferData
                                                                              .id]![
                                                                      "isLike"] ==
                                                                  true
                                                              ? Icon(
                                                                  Icons
                                                                      .favorite,
                                                                  color: Colors
                                                                      .red,
                                                                  size: 5.w,
                                                                )
                                                              : Icon(
                                                                  Icons
                                                                      .favorite_border,
                                                                  color:
                                                                      ColorUtils
                                                                          .grey89,
                                                                  size: 5.w,
                                                                )
                                                          : todayOfferData
                                                                      .wishlist ==
                                                                  "No"
                                                              ? Icon(
                                                                  Icons
                                                                      .favorite_border,
                                                                  color:
                                                                      ColorUtils
                                                                          .grey89,
                                                                  size: 5.w,
                                                                )
                                                              : Icon(
                                                                  Icons
                                                                      .favorite,
                                                                  color: Colors
                                                                      .red,
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
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// Again show line home scr
  customRepeatTextAndButton(text, buttontext, OnTab onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: FontTextStyle.categoriesTitleStyle,
        ),
        CustomBtn(
          onTap: onTap,
          bgColor: ColorUtils.lightPink63,
          height: 9.w,
          radius: 5.0,
          style: FontTextStyle.buttonTextColor,
          width: 23.w,
          title: buttontext,
        ),
      ],
    );
  }
}
