import 'dart:developer';

import 'package:my_shop/modal/apiModel/request_model/update_cart_qty_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/update_cart_qty_res_model.dart';
import '../../utils/enum_utils.dart';
import '../services/api_service.dart';
import '../services/base_service.dart';

class UpdateCartQtyRepo extends BaseService {
  ///  ==========================update cart qty Repo====================

  Future<UpdateCartQtyResModel> updateCartQtyRepo(
      UpdateCartQtyReqModel model) async {
    Map<String, dynamic> body = model.toJson();

    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: mainUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");
    final updateCartQtyResModel = UpdateCartQtyResModel.fromJson(response);
    return updateCartQtyResModel;
  }
}
