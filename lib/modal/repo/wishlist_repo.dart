import 'dart:developer';
import 'package:my_shop/modal/apiModel/request_model/addWishListMultipleDataReqModel.dart';
import 'package:my_shop/modal/apiModel/request_model/get_my_wishlist_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/addWishListMultipleDataResModel.dart';
import 'package:my_shop/modal/apiModel/response_model/get_my_wishlist_res_model.dart';
import 'package:my_shop/modal/services/base_service.dart';
import '../../utils/enum_utils.dart';
import '../apiModel/request_model/product_add_to_wishlist_req_model.dart';
import '../apiModel/request_model/remove_wishlist_req_model.dart';
import '../apiModel/response_model/product_add_to_wishlist_res_model.dart';
import '../apiModel/response_model/remove_wishlist_res_model.dart';
import '../services/api_service.dart';

class WishListRepo extends BaseService {
  ///  ==========================Add Product To WishList Repo====================

  Future<ProductAddToWishlistResModel> addWishListRepo(
      ProductAddToWishlistReqModel model) async {
    Map<String, dynamic> body = model.toJson();

    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: mainUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");
    ProductAddToWishlistResModel productAddToWishlistResModel =
        ProductAddToWishlistResModel.fromJson(response);
    return productAddToWishlistResModel;
  }

  ///  ==========================Remove Wishlist Repo====================

  Future<RemoveWishlistResModel> removeWishlistRepo(
      RemoveWishlistReqModel model) async {
    Map<String, dynamic> body = model.toJson();

    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: mainUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");
    final removeWishlistResModel = RemoveWishlistResModel.fromJson(response);
    return removeWishlistResModel;
  }

  ///  ==========================Get My Wishlist Repo====================

  Future<GetMyWishListResModel> myWishListRepo(
      GetMyWishListReqModel model) async {
    Map<String, dynamic> body = model.toJson();

    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: mainUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");
    final getMyWishListResModel = GetMyWishListResModel.fromJson(response);
    return getMyWishListResModel;
  }

  /// ================= add wishlist multiple data ==========

  Future<addWishListMultipleDataResModel> addMultipleDataWishListRepo(
      addWishListMultipleDataReqModel model) async {
    Map<String, dynamic> body = model.toJson();

    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: mainUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");
    addWishListMultipleDataResModel wishListMultipleDataResModel =
        addWishListMultipleDataResModel.fromJson(response);
    return wishListMultipleDataResModel;
  }
}
