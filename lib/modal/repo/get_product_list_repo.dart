import 'dart:developer';
import 'package:my_shop/modal/apiModel/request_model/get_product_list_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/get_product_list_res_model.dart';
import 'package:my_shop/modal/services/base_service.dart';
import '../../utils/enum_utils.dart';
import '../services/api_service.dart';

class GetProductListRepo extends BaseService {
  ///  ==========================Get Product List Repo====================

  Future<GetProductListResModel> getProductListRepo(
      GetProductListReqModel model) async {
    Map<String, dynamic> body = model.toJson();

    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: mainUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");
    GetProductListResModel getProductListResModel =
        GetProductListResModel.fromJson(response);
    return getProductListResModel;
  }
}
