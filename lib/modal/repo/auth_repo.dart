import 'dart:developer';
import 'package:my_shop/modal/apiModel/request_model/change_password_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/forgot_password_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/logout_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/change_password_res_model.dart';
import 'package:my_shop/modal/apiModel/response_model/forgot_password_res_model.dart';
import 'package:my_shop/modal/apiModel/response_model/logout_res_model.dart';
import 'package:my_shop/modal/apiModel/response_model/reset_password_res_model.dart';
import 'package:my_shop/modal/apiModel/response_model/sign_up_res_model.dart';
import 'package:my_shop/modal/services/base_service.dart';
import '../../utils/enum_utils.dart';
import '../apiModel/request_model/login_req_model.dart';
import '../apiModel/request_model/reset_password_req_model.dart';
import '../apiModel/request_model/sign_up_req_model.dart';
import '../apiModel/response_model/login_res_model.dart';
import '../services/api_service.dart';

class AuthRepo extends BaseService {
  ///  ==========================Sign Up Repo====================

  Future<SignUpResModel> signUpRepo(SignUpReqModel model) async {
    Map<String, dynamic> body = model.toJson();

    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: mainUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");
    SignUpResModel signUpResModel = SignUpResModel.fromJson(response);
    return signUpResModel;
  }

  ///  ==========================Login Repo====================

  Future<LogInResModel> logInRepo(LogInReqModel model) async {
    Map<String, dynamic> body = model.toJson();

    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: mainUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");
    LogInResModel logInResModel = LogInResModel.fromJson(response);
    return logInResModel;
  }

  ///  ==========================ForgotPassword Repo====================
  Future<ForgotPasswordResModel> forgotPasswordRepo(
      ForgotPasswordReqModel model) async {
    Map<String, dynamic> body = model.toJson();

    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: mainUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");
    ForgotPasswordResModel forgotPasswordResModel =
        ForgotPasswordResModel.fromJson(response);
    return forgotPasswordResModel;
  }

  ///  ==========================Logout Repo====================
  Future<LogOutResModel> logOutRepo(LogOutReqModel model) async {
    Map<String, dynamic> body = model.toJson();

    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: mainUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");
    LogOutResModel logOutResModel = LogOutResModel.fromJson(response);
    return logOutResModel;
  }

  ///  ==========================Reset Password Repo====================
  Future<ResetPasswordResModel> resetPasswordRepo(
      ResetPasswordReqModel model) async {
    Map<String, dynamic> body = model.toJson();

    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: mainUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");
    ResetPasswordResModel resetPasswordResModel =
        ResetPasswordResModel.fromJson(response);
    return resetPasswordResModel;
  }

  ///  ==========================change password Repo====================

  Future<ChangePasswordResModel> changePasswordRepo(
      ChangePasswordReqModel model) async {
    Map<String, dynamic> body = model.toJson();

    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: mainUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");
    final changePasswordResModel = ChangePasswordResModel.fromJson(response);
    return changePasswordResModel;
  }
}
