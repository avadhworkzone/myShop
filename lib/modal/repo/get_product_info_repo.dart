import 'dart:developer';
import 'package:my_shop/modal/apiModel/request_model/get_product_info_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/get_product_info_res_model.dart';
import 'package:my_shop/utils/enum_utils.dart';
import '../services/api_service.dart';
import '../services/base_service.dart';

class GetProductInfoRepo extends BaseService {
  ///  ==========================Get Product Info Repo====================

  Future<GetProductInfoResModel> getProductInfoRepo(
      GetProductInfoReqModel model) async {
    Map<String, dynamic> body = model.toJson();

    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: mainUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");
    final getProductInfoResModel = GetProductInfoResModel.fromJson(response);
    return getProductInfoResModel;
  }
}
