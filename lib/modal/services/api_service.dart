import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../utils/enum_utils.dart';
import '../../utils/shared_preference_utils.dart';
import '../apis/api_exception.dart';
import 'base_service.dart';

class ApiService extends BaseService {
  var response;
  // final dio.Dio _dio = dio.Dio();
  // Future<dynamic> sendFile(List<File> file) async {
  //   List<dio.MultipartFile> mList = file
  //       .map((e) => MultipartFile.fromFileSync(e.path,
  //       filename: e.path.split('/').last))
  //       .toList();
  //   FormData formData = FormData.fromMap(
  //     {
  //       "photos[]": mList,
  //     },
  //   );

  // response = await _dio.post(baseUrl + uploadPhoto,
  //     data: formData,
  //     options: dio.Options(
  //       headers: {
  //         'Content-Type': "form-data",
  //         "Authorization": 'Bearer ${PreferenceManagerUtils.getToken()}'
  //       },
  //     ));
  // response = returnResponse(response.statusCode!, jsonEncode(response.data));
  // log("===jsonEncode=======response=============$response");
  //
  // return response;
  // }

  Map<String, String> header({APIHeaderType? status}) {
    String token = PreferenceUtils.getToken();

    if (status == APIHeaderType.fileUploadWithToken) {
      return {'Content-Type': "form-data", "Authorization": 'Bearer $token'};
    } else if (status == APIHeaderType.fileUploadWithoutToken) {
      return {
        'Content-Type': "form-data",
      };
    } else if (status == APIHeaderType.jsonBodyWithToken) {
      return {
        'Content-Type': 'application/json',
        "Authorization": 'Bearer $token'
      };
    } else if (status == APIHeaderType.onlyToken) {
      return {"Authorization": 'Bearer $token'};
    } else {
      return {
        'Content-Type': 'application/json',
      };
    }
  }

  Future<dynamic> getResponse(
      {required APIType? apiType,
      required String? url,
      Map<String, dynamic>? body,
      bool withToken = true,
      bool fileUpload = false}) async {
    print('URL : ${url}');
    // String uri = Url;
    log("REQUEST FOR API ${jsonEncode(body)}");
    try {
      if (apiType == APIType.aGet) {
        var result = await http.get(Uri.parse(url!),
            headers: header(
              status: withToken
                  ? APIHeaderType.jsonBodyWithToken
                  : APIHeaderType.jsonBodyWithoutToken,
            ));
        response = returnResponse(
          result.statusCode,
          result.body,
        );
        log("Result==================${result.body}");
      } else if (apiType == APIType.aPost) {
        var result = await http.post(
          Uri.parse(url!),
          body: jsonEncode(body),
          headers: header(
            status: withToken
                ? APIHeaderType.jsonBodyWithToken
                : APIHeaderType.jsonBodyWithoutToken,
          ),
        );
        response = returnResponse(
          result.statusCode,
          result.body,
        );
        log("Result==================${result.body}");
      } else if (apiType == APIType.aPut) {
        var result = await http.put(
          Uri.parse(url!),
          body: jsonEncode(body),
          headers: header(),
        );

        response = returnResponse(
          result.statusCode,
          result.body,
        );
        log("Result==================${result.body}");
      } else if (apiType == APIType.aDelete) {
        var result = await http.delete(Uri.parse(url!));
        response = returnResponse(
          result.statusCode,
          result.body,
        );
        log("Result==================${result.body}");
      }
      return response;
    } catch (e) {
      log('Error=>.. $e');
    }
  }

  returnResponse(int status, String result) {
    print("status$status");
    switch (status) {
      case 200:
        return jsonDecode(result);
      case 256:
        return jsonDecode(result);
      case 422:
        return jsonDecode(result);
      case 400:
        throw BadRequestException('Bad Request');
      case 401:
        throw UnauthorisedException('Unauthorised user');
      case 404:
        throw ServerException('Server Error');
      case 500:
      default:
        return jsonDecode(result);
    }
  }
}
