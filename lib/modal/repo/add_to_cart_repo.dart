import 'dart:developer';
import 'package:my_shop/modal/apiModel/request_model/add_to_cart_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/add_to_cart_res_model.dart';
import '../../utils/enum_utils.dart';
import '../services/api_service.dart';
import '../services/base_service.dart';

class AddToCartRepo extends BaseService {
  ///  ==========================Add To Cart Repo====================

  Future<ProductAddToCartResModel> addCartRepo(
      ProductAddToCartReqModel model) async {
    Map<String, dynamic> body = model.toJson();

    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: mainUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");
    final productAddToCartResModel =
        ProductAddToCartResModel.fromJson(response);
    return productAddToCartResModel;
  }
}
