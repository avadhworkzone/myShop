import 'dart:developer';
import 'package:get/get.dart';
import 'package:my_shop/modal/apiModel/request_model/change_password_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/forgot_password_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/logout_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/reset_password_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/sign_up_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/change_password_res_model.dart';
import 'package:my_shop/modal/apiModel/response_model/forgot_password_res_model.dart';
import 'package:my_shop/modal/apiModel/response_model/logout_res_model.dart';
import 'package:my_shop/modal/apiModel/response_model/reset_password_res_model.dart';
import '../modal/apiModel/request_model/login_req_model.dart';
import '../modal/apiModel/response_model/login_res_model.dart';
import '../modal/apiModel/response_model/sign_up_res_model.dart';
import '../modal/apis/api_response.dart';
import '../modal/repo/auth_repo.dart';

class AuthViewModel extends GetxController {
  ApiResponse signUpApiResponse = ApiResponse.initial('Initial');
  ApiResponse loginApiResponse = ApiResponse.initial('Initial');
  ApiResponse forgotPasswordApiResponse = ApiResponse.initial('Initial');
  ApiResponse logOutApiResponse = ApiResponse.initial('Initial');
  ApiResponse resetPasswordApiResponse = ApiResponse.initial('Initial');

  ///==================SignUp ViewModel================

  Future<void> signUpViewModel(SignUpReqModel body) async {
    signUpApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      SignUpResModel response = await AuthRepo().signUpRepo(body);
      signUpApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('signUpApiResponse.......$e');
      signUpApiResponse = ApiResponse.error('error');
    }
    update();
  }

  ///==================Login ViewModel================

  Future<void> loginViewModel(LogInReqModel body) async {
    loginApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      LogInResModel response = await AuthRepo().logInRepo(body);
      loginApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('LoginApiResponse.......$e');
      loginApiResponse = ApiResponse.error('error');
    }
    update();
  }

  ///==================ForgotPassword ViewModel================
  Future<void> forgotPasswordViewModel(ForgotPasswordReqModel body) async {
    forgotPasswordApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      ForgotPasswordResModel response =
          await AuthRepo().forgotPasswordRepo(body);
      forgotPasswordApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('ForgotPasswordApiResponse.......$e');
      forgotPasswordApiResponse = ApiResponse.error('error');
    }
    update();
  }

  ///==================Logout ViewModel================
  Future<void> logOutViewModel(LogOutReqModel body) async {
    logOutApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      LogOutResModel response = await AuthRepo().logOutRepo(body);
      logOutApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('LogOutApiResponse.......$e');
      logOutApiResponse = ApiResponse.error('error');
    }
    update();
  }

  ///==================Logout ViewModel================
  Future<void> resetPasswordViewModel(ResetPasswordReqModel body) async {
    resetPasswordApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      ResetPasswordResModel response = await AuthRepo().resetPasswordRepo(body);
      resetPasswordApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('resetPasswordApiResponse.......$e');
      resetPasswordApiResponse = ApiResponse.error('error');
    }
    update();
  }

  ApiResponse changePasswordApiResponse = ApiResponse.initial('Initial');

  ///================== change password ViewModel================

  Future<void> changePasswordViewModel(ChangePasswordReqModel body) async {
    changePasswordApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      ChangePasswordResModel response =
          await AuthRepo().changePasswordRepo(body);
      changePasswordApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('changePasswordApiResponse.......$e');
      changePasswordApiResponse = ApiResponse.error('error');
    }
    update();
  }
}
