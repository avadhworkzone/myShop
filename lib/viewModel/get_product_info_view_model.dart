import 'dart:developer';
import 'package:get/get.dart';
import 'package:my_shop/modal/apiModel/request_model/get_product_info_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/get_product_info_res_model.dart';
import 'package:my_shop/modal/apis/api_response.dart';
import '../modal/repo/get_product_info_repo.dart';

class GetProductInfoViewModel extends GetxController {
  ApiResponse getProductInfoApiResponse = ApiResponse.initial('Initial');

  ///==================Get Product Info ViewModel================

  Future<void> getProductInfoViewModel(GetProductInfoReqModel body) async {
    getProductInfoApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      GetProductInfoResModel response =
          await GetProductInfoRepo().getProductInfoRepo(body);
      getProductInfoApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('getProductInfoApiResponse.......$e');
      getProductInfoApiResponse = ApiResponse.error('error');
    }
    update();
  }
}
