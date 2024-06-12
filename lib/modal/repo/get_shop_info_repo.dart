import 'dart:developer';
import 'package:my_shop/modal/apiModel/request_model/get_shop_info_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/get_shop_info_res_model.dart';
import '../../utils/enum_utils.dart';
import '../services/api_service.dart';
import '../services/base_service.dart';

class GetShopInfoRepo extends BaseService {
  ///  ==========================Get Shop Info Repo====================

  Future<GetShopInfoResModel> getShopInfoRepo(GetShopInfoReqModel model) async {
    Map<String, dynamic> body = model.toJson();

    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: mainUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");
    final getShopInfoResModel = GetShopInfoResModel.fromJson(response);
    return getShopInfoResModel;
  }
}
