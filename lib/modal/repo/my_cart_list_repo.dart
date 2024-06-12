import 'dart:developer';

import 'package:my_shop/modal/apiModel/request_model/my_cart_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/my_cart_res_model.dart';

import '../../utils/enum_utils.dart';
import '../services/api_service.dart';
import '../services/base_service.dart';

class MyCartListRepo extends BaseService {
  ///  ==========================My Cart Repo====================

  Future<MyCartListResModel> myCartListRepo(MyCartListReqModel model) async {
    Map<String, dynamic> body = model.toJson();

    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: mainUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");
    MyCartListResModel myCartListResModel =
        MyCartListResModel.fromJson(response);
    return myCartListResModel;
  }
}
