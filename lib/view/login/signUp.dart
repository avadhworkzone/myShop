import 'package:get/get.dart';
import 'package:my_shop/modal/apiModel/request_model/add_to_cart_req_model.dart';
import 'package:my_shop/modal/apiModel/request_model/sign_up_req_model.dart';
import 'package:my_shop/modal/apiModel/response_model/sign_up_res_model.dart';
import 'package:my_shop/view/general/bottombar_screens/more/terms_and_conditions.dart';
import 'package:my_shop/viewModel/cart_view_model.dart';
import 'package:sizer/sizer.dart';
import '../../commanWidget/custom_snackbar.dart';
import '../../modal/apis/api_response.dart';
import '../../utils/color_utils.dart';
import '../../utils/shared_preference_utils.dart';
import '../../view/login/signIn.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/variable_utils.dart';
import '../../utils/decoration_utils.dart';
import '../../utils/font_style_utils.dart';
import '../../utils/size_config_utils.dart';
import '../../commanWidget/custom_btn.dart';
import '../../utils/assets/images_utils.dart';
import '../../controllers/signUp_controller.dart';
import '../../commanWidget/common_textFormField.dart';
import '../../viewModel/auth_viewmodel.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final registerFormKey = GlobalKey<FormState>();
  SignUpController signUpController = Get.put(SignUpController());
  var controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = Get.find();

    CartViewModel cartViewModel = Get.find();
    SignUpReqModel signUpReqModel = SignUpReqModel();
    ProductAddToCartReqModel productAddToCartReqModel =
        ProductAddToCartReqModel();
    CustomSnackbar snackbar = CustomSnackbar();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizeConfig.sH05,
              Container(
                height: 35.h,
                width: double.infinity,
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  image: DecorationUtils.registerBgDecoration(),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(4.w, 2.h, 0, 0),
                  child: Text(
                    VariableUtils.signUpTextText,
                    style: FontTextStyle.loginTitleStyle,
                  ),
                ),
              ),
              Form(
                key: registerFormKey,
                child: Obx(
                  () => Column(
                    children: [
                      CommonTextField(
                        obscured: false,
                        typeText: VariableUtils.fullNameText,
                        controller: signUpController.nameController,
                        keyboard: TextInputType.name,
                        icon: ImagesWidgets.userImage,
                        input: "[A-z ]",
                        // input: "[A-z {1}A-z]",
                        validate: signUpController.validateName,
                      ),
                      CommonTextField(
                        obscured: false,
                        input: "[A-z@.]",
                        icon: ImagesWidgets.gmailImage,
                        typeText: VariableUtils.emailAddressText,
                        keyboard: TextInputType.emailAddress,
                        validate: signUpController.validateEmail,
                        controller: signUpController.emailController,
                      ),
                      CommonContactField(
                        typeText: VariableUtils.mobileNumberText,
                        keyboard: TextInputType.number,
                        icon: ImagesWidgets.mobileImage,
                        controller: signUpController.contactController,
                      ),
                      passwordTextField(
                        VariableUtils.passwordText,
                        signUpController.passwordController,
                        TextInputType.visiblePassword,
                        signUpController.isVisible1.value == false
                            ? ImagesWidgets.visiblityOffImage
                            : ImagesWidgets.visiblityImage,
                        signUpController.isVisible1.value == false
                            ? true
                            : false,
                        signUpController.validatePassword,
                      ),
                      passwordTextField(
                        VariableUtils.confirmPassword,
                        signUpController.confirmPassword,
                        TextInputType.visiblePassword,
                        signUpController.isVisible2.value == false
                            ? ImagesWidgets.visiblityOffImage
                            : ImagesWidgets.visiblityImage,
                        signUpController.isVisible2.value == false
                            ? true
                            : false,
                        signUpController.validateConfirmassword,
                      ),
                      SizeConfig.sH2,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: VariableUtils.agreeText,
                                style: FontTextStyle.alreadyStyle,
                              ),
                              TextSpan(
                                text: VariableUtils.termsOfServiceText,
                                style: FontTextStyle.policyStyle
                                    .copyWith(fontFamily: 'Neusa'),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.to(
                                        () => const TermsConditions(),
                                      ),
                              ),
                              TextSpan(
                                text: VariableUtils.andSign,
                                style: FontTextStyle.alreadyStyle,
                              ),
                              TextSpan(
                                text: VariableUtils.provacyPolicyText,
                                style: FontTextStyle.policyStyle
                                    .copyWith(fontFamily: 'Neusa'),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.to(
                                        () => const TermsConditions(),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizeConfig.sH2,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: CustomBtn(
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                            if (registerFormKey.currentState!.validate()) {
                              // signUpController.ckeckSignUp();
                              registerFormKey.currentState!.save();
                              signUpReqModel.name =
                                  signUpController.nameController.text;

                              signUpReqModel.email =
                                  signUpController.emailController.text;

                              signUpReqModel.mobileNo =
                                  signUpController.contactController.text;

                              signUpReqModel.password =
                                  signUpController.passwordController.text;

                              await authViewModel
                                  .signUpViewModel(signUpReqModel);

                              if (authViewModel.signUpApiResponse.status ==
                                  Status.COMPLETE) {
                                SignUpResModel response =
                                    authViewModel.signUpApiResponse.data;
                                if (response.data!.isEmpty) {
                                  snackbar.customSnackBar(
                                    context,
                                    '${response.message}',
                                    ColorUtils.primaryColor,
                                  );
                                  signUpController.nameController.clear();
                                  signUpController.emailController.clear();
                                  signUpController.contactController.clear();
                                  signUpController.passwordController.clear();
                                  signUpController.confirmPassword.clear();
                                  return;
                                }
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
                                Future.delayed(
                                  const Duration(seconds: 1),
                                  () {
                                    Get.off(SignIn());
                                  },
                                );
                              }
                            }

                          },
                          height: 7.h,
                          title: VariableUtils.registerText,
                          bgColor: ColorUtils.primaryColor,
                          style: FontTextStyle.buttonTitleStyle,
                        ),
                      ),
                      SizeConfig.sH2,
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: VariableUtils.alreadyAccountText,
                              style: FontTextStyle.alreadyStyle,
                            ),
                            TextSpan(
                              text: VariableUtils.logInText,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(
                                      () => SignIn(),
                                    ),
                              style: FontTextStyle.signUpStyle,
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

  Widget passwordTextField(
      typeText, controller, keyboard, icon, obscured, validate) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizeConfig.sH3,
          Text(
            typeText,
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
                  onTap: () {
                    VariableUtils.passwordText == typeText
                        ? signUpController.passwordVisible()
                        : signUpController.confitmPasswordVisible();
                  },
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
