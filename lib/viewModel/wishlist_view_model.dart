import 'dart:developer';
import 'package:get/get.dart';
import 'package:my_shop/modal/apiModel/request_model/get_my_wishlist_req_model.dart';
import '../modal/apiModel/request_model/addWishListMultipleDataReqModel.dart';
import '../modal/apiModel/request_model/product_add_to_wishlist_req_model.dart';
import '../modal/apiModel/request_model/remove_wishlist_req_model.dart';
import '../modal/apiModel/response_model/product_add_to_wishlist_res_model.dart';
import '../modal/apiModel/response_model/remove_wishlist_res_model.dart';
import '../modal/apis/api_response.dart';
import '../modal/repo/wishlist_repo.dart';

class WishListViewModel extends GetxController {
  ApiResponse addToWishListApiResponse = ApiResponse.initial('Initial');
  ApiResponse removeWishlistApiResponse = ApiResponse.initial('Initial');
  ApiResponse getWishListApiResponse = ApiResponse.initial('Initial');
  ApiResponse addMultipleDataWishListApiResponse =
      ApiResponse.initial('Initial');

  RxMap<String?, dynamic> wishlistData = Map<String?, dynamic>().obs;

  Map<String, Map> wishListLocalData = {};

  ///==================Add Wish List ViewModel================

  Future<void> productAddToWishListViewModel(
      ProductAddToWishlistReqModel body) async {
    addToWishListApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      ProductAddToWishlistResModel response =
          await WishListRepo().addWishListRepo(body);
      addToWishListApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('addToWishListApiResponse.......$e');
      addToWishListApiResponse = ApiResponse.error('error');
    }
    update();
  }

  ///==================Remove Wish List ViewModel================

  Future<void> removeWishlistViewModel(RemoveWishlistReqModel body) async {
    removeWishlistApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      RemoveWishlistResModel response =
          await WishListRepo().removeWishlistRepo(body);
      removeWishlistApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('removeWishlistApiResponse.......$e');
      removeWishlistApiResponse = ApiResponse.error('error');
    }
    update();
  }

  ///==================Get My Wish List ViewModel================

  Future<void> getMyWishlistViewModel(GetMyWishListReqModel body) async {
    getWishListApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      final response = await WishListRepo().myWishListRepo(body);
      getWishListApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('getWishListApiResponse.......$e');
      getWishListApiResponse = ApiResponse.error('error');
    }
    update();
  }

  ///==================add multiple data  Wish List ViewModel================

  Future<void> addMultipleWishlistDataViewModel(
      addWishListMultipleDataReqModel body) async {
    addMultipleDataWishListApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      final response = await WishListRepo().addMultipleDataWishListRepo(body);
      addMultipleDataWishListApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('addMultipleDataWishListApiResponse.......$e');
      addMultipleDataWishListApiResponse = ApiResponse.error('error');
    }
    update();
  }
}
