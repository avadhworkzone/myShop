import 'dart:developer';

import 'package:my_shop/modal/apiModel/request_model/remove_cart_product_req.dart';
import 'package:my_shop/modal/apiModel/response_model/remove_cart_product_res.dart';

import '../../utils/enum_utils.dart';
import '../services/api_service.dart';
import '../services/base_service.dart';

class RemoveToCartRepo extends BaseService {
  ///  ==========================Remove To Cart Repo====================

  Future<RemoveProductToCartResModel> removeToCartRepo(
      RemoveProductToCartReqModel model) async {
    Map<String, dynamic> body = model.toJson();

    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: mainUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");
    final removeProductToCartResModel =
        RemoveProductToCartResModel.fromJson(response);
    return removeProductToCartResModel;
  }
}
