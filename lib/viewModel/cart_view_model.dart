import 'dart:developer';
import 'package:get/get.dart';
import 'package:my_shop/modal/apiModel/request_model/remove_cart_product_req.dart';
import 'package:my_shop/modal/apiModel/request_model/update_cart_qty_req_model.dart';
import 'package:my_shop/modal/repo/remove_to_cart_repo.dart';
import 'package:my_shop/modal/repo/update_cart_repo.dart';
import '../modal/apiModel/request_model/add_to_cart_req_model.dart';
import '../modal/apiModel/request_model/my_cart_req_model.dart';
import '../modal/apis/api_response.dart';
import '../modal/repo/add_to_cart_repo.dart';
import '../modal/repo/my_cart_list_repo.dart';

class CartViewModel extends GetxController {
  ApiResponse addToCartApiResponse = ApiResponse.initial('Initial');
  ApiResponse myCartApiResponse = ApiResponse.initial('Initial');
  ApiResponse removeToCartApiResponse = ApiResponse.initial('Initial');
  ApiResponse updateCartQtyApiResponse = ApiResponse.initial('Initial');

  // RxMap<String?, int?> addToCartData = Map<String?, int?>().obs;

  List<Map<String, dynamic>> addToCartLocalData = [];
  List storedProduct = [];
  num total = 0;

  ///==================Add Cart ViewModel================

  Future<void> productAddToCartViewModel(ProductAddToCartReqModel body) async {
    addToCartApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      final response = await AddToCartRepo().addCartRepo(body);
      addToCartApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('addToCartApiResponse.......$e');
      addToCartApiResponse = ApiResponse.error('error');
    }
    update();
  }

  ///==================My Cart ViewModel================

  Future<void> myCartListViewModel(MyCartListReqModel body) async {
    myCartApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      final response = await MyCartListRepo().myCartListRepo(body);
      myCartApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('myCartApiResponse.......$e');
      myCartApiResponse = ApiResponse.error('error');
    }
    update();
  }

  ///==================Remove Cart ViewModel================

  Future<void> removeCartListViewModel(RemoveProductToCartReqModel body) async {
    removeToCartApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      final response = await RemoveToCartRepo().removeToCartRepo(body);
      removeToCartApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('removeToCartApiResponse.......$e');
      removeToCartApiResponse = ApiResponse.error('error');
    }
    update();
  }

  ///==================Update Cart Qty ViewModel==============

  Future<void> updateCartQtyViewModel(UpdateCartQtyReqModel body) async {
    updateCartQtyApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      final response = await UpdateCartQtyRepo().updateCartQtyRepo(body);
      updateCartQtyApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('updateCartQtyApiResponse.......$e');
      updateCartQtyApiResponse = ApiResponse.error('error');
    }
    update();
  }
}
