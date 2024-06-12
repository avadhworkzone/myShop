import 'dart:developer';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_shop/modal/apiModel/request_model/get_all_product_list_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/get_shop_info_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/get_all_product_list_res_model.dart';
import 'package:my_shop/modal/repo/get_all_product_list_repo.dart';
import 'package:my_shop/modal/repo/get_shop_info_repo.dart';
import '../modal/apiModel/request_model/get_category_list_req_model.dart';
import '../modal/apiModel/response_model/get_category_list_res_model.dart';
import '../modal/apis/api_response.dart';
import '../modal/repo/get_category_list_repo.dart';

class GetAllProductListAndCategoryListViewModel extends GetxController {
  ApiResponse getAllNewArrivalProductListApiResponse =
      ApiResponse.initial('Initial');
  ApiResponse getAllTodayOfferProductListApiResponse =
      ApiResponse.initial('Initial');
  ApiResponse getAllProductListDataApiResponse = ApiResponse.initial('Initial');
  String searchProduct = '';

  ///==================Get product List ViewModel================

  /// all data
  Future<void> getAllProductListDataViewModel(
      GetAllProductListReqModel body) async {
    getAllProductListDataApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      GetAllProductListResModel response =
          await GetAllProductListRepo().getAllProductListRepo(body);
      getAllProductListDataApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('getAllProductListDataApiResponse.......$e');
      getAllProductListDataApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// new arrival data
  Future<void> getAllNewArrivalProductListViewModel(
      GetAllProductListReqModel body) async {
    getAllNewArrivalProductListApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      GetAllProductListResModel response =
          await GetAllProductListRepo().getAllProductListRepo(body);
      getAllNewArrivalProductListApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('getAllNewArrivalProductListApiResponse.......$e');
      getAllNewArrivalProductListApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// todays offer data
  Future<void> getAllTodayOfferProductListViewModel(
      GetAllProductListReqModel body) async {
    getAllTodayOfferProductListApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      GetAllProductListResModel response =
          await GetAllProductListRepo().getAllProductListRepo(body);
      getAllTodayOfferProductListApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('getAllTodayOfferProductListApiResponse.......$e');
      getAllTodayOfferProductListApiResponse = ApiResponse.error('error');
    }
    update();
  }

  ApiResponse getCategoryListApiResponse = ApiResponse.initial('Initial');

  ///==================Get Category List ViewModel================

  Future<void> getCategoryListViewModel(GetCategoryListReqModel body) async {
    getCategoryListApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      GetCategoryListResModel response =
          await GetCategoryListRepo().getCategoryListRepo(body);
      getCategoryListApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('getCategoryListApiResponse.......$e');
      getCategoryListApiResponse = ApiResponse.error('error');
    }
    update();
  }

  ApiResponse getShopInfoApiResponse = ApiResponse.initial('Initial');

  ///==================Get Shop Info ViewModel================

  Future<void> getProductListViewModel(GetShopInfoReqModel body) async {
    getShopInfoApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      final response = await GetShopInfoRepo().getShopInfoRepo(body);
      getShopInfoApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('getShopInfoApiResponse.......$e');
      getShopInfoApiResponse = ApiResponse.error('error');
    }
    update();
  }
}
