import 'dart:developer';
import 'package:my_shop/modal/apiModel/request_model/get_category_list_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/get_category_list_res_model.dart';
import '../../utils/enum_utils.dart';
import '../services/api_service.dart';
import '../services/base_service.dart';

class GetCategoryListRepo extends BaseService {
  ///  ==========================Get Category List Repo====================

  Future<GetCategoryListResModel> getCategoryListRepo(
      GetCategoryListReqModel model) async {
    Map<String, dynamic> body = model.toJson();

    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: mainUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");
    GetCategoryListResModel getCategoryListResModel =
        GetCategoryListResModel.fromJson(response);
    return getCategoryListResModel;
  }
}
