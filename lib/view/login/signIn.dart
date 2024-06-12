import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_shop/modal/apiModel/request_model/addWishListMultipleDataReqModel.dart';
import 'package:my_shop/modal/apiModel/request_model/add_to_cart_req_model.dart';
import 'package:my_shop/viewModel/cart_view_model.dart';
import 'package:my_shop/viewModel/wishlist_view_model.dart';
import 'package:sizer/sizer.dart';
import '../../commanWidget/custom_btn.dart';
import '../../commanWidget/custom_snackbar.dart';
import '../../modal/apiModel/request_model/login_req_model.dart';
import '../../modal/apiModel/response_model/login_res_model.dart';
import '../../modal/apis/api_response.dart';
import '../../utils/shared_preference_utils.dart';
import '../../view/login/signUp.dart';
import '../../utils/color_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../../utils/variable_utils.dart';
import '../../utils/decoration_utils.dart';
import '../../utils/font_style_utils.dart';
import '../../utils/size_config_utils.dart';
import '../../view/login/forgotPassword.dart';
import '../../utils/assets/images_utils.dart';
import '../../controllers/signIn_controller.dart';
import '../../commanWidget/common_textFormField.dart';
import '../../viewModel/auth_viewmodel.dart';
import '../general/bottombar_screens/bottombar_screen.dart';
import '../general/bottombar_screens/card/shopping_cart.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key, this.isnavigate}) : super(key: key);

  bool? isnavigate;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthViewModel authViewModel = Get.find();

  LogInReqModel logInReqModel = LogInReqModel();
  CartViewModel cartViewModel = Get.find();
  WishListViewModel wishListViewModel = Get.find();
  addWishListMultipleDataReqModel wishListMultipleDataReqModel =
      addWishListMultipleDataReqModel();
  ProductAddToCartReqModel productAddToCartReqModel =
      ProductAddToCartReqModel();
  CustomSnackbar snackbar = CustomSnackbar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 40.h,
                width: double.infinity,
                alignment: Alignment.topLeft,
                decoration: DecorationUtils.loginBgDecoration(),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(4.w, 2.h, 0, 0),
                  child: Text(
                    VariableUtils.loginText,
                    style: FontTextStyle.loginTitleStyle,
                  ),
                ),
              ),
              Form(
                key: loginFormKey,
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CommonTextField(
                        input: "[A-z@.]",
                        controller: signInController.emailController,
                        typeText: VariableUtils.emailAddressText,
                        icon: ImagesWidgets.gmailImage,
                        keyboard: TextInputType.emailAddress,
                        validate: signInController.validateEmail,
                        obscured: false,
                      ),
                      passwordTextField(
                        signInController.passwordController,
                        TextInputType.visiblePassword,
                        signInController.isVisible.value == true
                            ? ImagesWidgets.visiblityImage
                            : ImagesWidgets.visiblityOffImage,
                        signInController.isVisible.value == true ? true : false,
                        signInController.validatePassword,
                      ),
                      SizeConfig.sH2,
                      // InkWell(
                      //   splashColor: ColorUtils.transparent,
                      //   highlightColor: ColorUtils.transparent,
                      //   onTap: () {
                      //     Get.to(
                      //       () => const ForgotPassword(),
                      //       transition: Transition.fadeIn,
                      //     );
                      //   },
                      //   child: Padding(
                      //     padding: EdgeInsets.symmetric(horizontal: 3.w),
                      //     child: Container(
                      //       alignment: Alignment.centerRight,
                      //       child: Text(
                      //         VariableUtils.forgotPasswordText,
                      //         style: FontTextStyle.forgotPasswordStyle,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              splashColor: ColorUtils.transparent,
                              highlightColor: ColorUtils.transparent,
                              onTap: () {
                                Get.to(() => const ForgotPassword());
                              },
                              child: Text(
                                VariableUtils.forgotPasswordText,
                                style: FontTextStyle.forgotPasswordStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizeConfig.sH2,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: CustomBtn(
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                            if (loginFormKey.currentState!.validate()) {
                              // signInController.checkLogin();
                              loginFormKey.currentState!.save();

                              logInReqModel.email =
                                  signInController.emailController.text;

                              logInReqModel.password =
                                  signInController.passwordController.text;

                              await authViewModel.loginViewModel(logInReqModel);

                              if (authViewModel.loginApiResponse.status ==
                                  Status.COMPLETE) {
                                LogInResModel response =
                                    authViewModel.loginApiResponse.data;
                                if (response.data!.isEmpty) {
                                  snackbar.customSnackBar(
                                    context,
                                    '${response.message}',
                                    ColorUtils.primaryColor,
                                  );
                                  return;
                                }
                                PreferenceUtils.setLogin(1);
                                PreferenceUtils.setUserId(
                                    response.data![0].userId!);

                                if (PreferenceUtils.getUserId().isNotEmpty ||
                                    cartViewModel
                                        .addToCartLocalData.isNotEmpty) {
                                  cartViewModel.addToCartLocalData
                                      .forEach((element) {
                                    productAddToCartReqModel.productId =
                                        element["id"];
                                    productAddToCartReqModel.qty =
                                        element["qty"].toString();
                                  });
                                  productAddToCartReqModel.userId =
                                      PreferenceUtils.getUserId();
                                  await cartViewModel.productAddToCartViewModel(
                                      productAddToCartReqModel);
                                  cartViewModel.addToCartLocalData.clear();
                                }
                                if (PreferenceUtils.getUserId().isNotEmpty ||
                                    wishListViewModel
                                        .wishListLocalData.isNotEmpty) {
                                  List wishListProductId = wishListViewModel
                                      .wishListLocalData.values
                                      .where((element) =>
                                          element['isLike'] == true)
                                      .toList()
                                      .map((e) => e['id'])
                                      .toList();
                                  wishListMultipleDataReqModel.productId =
                                      wishListProductId
                                          .map((e) => e.toString())
                                          .toList();
                                  wishListMultipleDataReqModel.userId =
                                      PreferenceUtils.getUserId();
                                  await wishListViewModel
                                      .addMultipleWishlistDataViewModel(
                                          wishListMultipleDataReqModel);
                                  wishListViewModel.wishListLocalData.clear();
                                }

                                Future.delayed(
                                  const Duration(seconds: 1),
                                  () {
                                    widget.isnavigate == true
                                        ? Get.to(ShoppingCart(
                                            redirectCartScreen: true))
                                        : Get.off(BottomScreen());
                                  },
                                );
                              }
                              signInController.emailController.clear();
                              signInController.passwordController.clear();
                            }
                          },
                          height: 7.h,
                          title: VariableUtils.logIn,
                          bgColor: ColorUtils.primaryColor,
                          style: FontTextStyle.buttonTitleStyle,
                        ),
                      ),
                      SizeConfig.sH2,
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: VariableUtils.doNotHaveAccountText,
                              style: FontTextStyle.alreadyStyle,
                            ),
                            TextSpan(
                              text: VariableUtils.signUp,
                              style: FontTextStyle.signUpStyle,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(
                                      () => const SignUp(),
                                    ),
                            ),
                          ],
                        ),
                      ),
                      SizeConfig.sH2,
                    ],
                  ),
                ),
              ),
              GetBuilder<AuthViewModel>(
                builder: (authViewModel) {
                  return GetBuilder<CartViewModel>(
                    builder: (addToCartController) {
                      if (authViewModel.loginApiResponse.status ==
                              Status.LOADING ||
                          addToCartController.addToCartApiResponse.status ==
                              Status.LOADING) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return const SizedBox();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  final loginFormKey = GlobalKey<FormState>();
  SignInController signInController = Get.put(SignInController());

  Widget passwordTextField(controller, keyboard, icon, obscured, validate) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizeConfig.sH3,
          Text(
            VariableUtils.passwordText,
            style: FontTextStyle.emailAddresStyle,
          ),
          SizeConfig.sH05,
          TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[^ ]"))
            ],
            controller: controller,
            keyboardType: keyboard,
            validator: (v) => validate(v),
            obscureText: obscured,
            obscuringCharacter: "*",
            cursorColor: ColorUtils.grey6F,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(3.w),
              errorStyle: FontTextStyle.errorStyle,
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                  vertical: 1.4.h,
                ),
                child: InkWell(
                  highlightColor: ColorUtils.transparent,
                  splashColor: ColorUtils.transparent,
                  onTap: () => signInController.passwordVisible(),
                  child: Image.asset(
                    icon,
                    color: ColorUtils.grey6F.withOpacity(0.5),
                    fit: BoxFit.fill,
                    scale: 4.h,
                  ),
                ),
              ),
              focusedBorder: const OutlineInputBorder(),
              border: const OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
