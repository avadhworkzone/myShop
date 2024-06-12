import 'dart:developer';
import 'package:get/get.dart';
import 'package:my_shop/modal/apiModel/request_model/get_product_list_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/get_product_list_res_model.dart';
import '../modal/apis/api_response.dart';
import '../modal/repo/get_product_list_repo.dart';

class GetProductListViewModel extends GetxController {
  ApiResponse getProductListApiResponse = ApiResponse.initial('Initial');

  ///==================Get Product List ViewModel================

  Future<void> getProductListViewModel(GetProductListReqModel body) async {
    getProductListApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      GetProductListResModel response =
          await GetProductListRepo().getProductListRepo(body);
      getProductListApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('getProductListApiResponse.......$e');
      getProductListApiResponse = ApiResponse.error('error');
    }
    update();
  }
}
