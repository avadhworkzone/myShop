// ignore_for_file: prefer_typing_uninitialized_variables, file_names

import 'package:sizer/sizer.dart';
import '../utils/color_utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../utils/font_style_utils.dart';
import '../utils/size_config_utils.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    Key? key,
    this.icon,
    this.typeText,
    this.controller,
    this.validate,
    this.keyboard,
    this.obscured,
    required this.input,
  }) : super(key: key);
  final controller, icon, typeText, validate, keyboard, obscured, input;

  @override
  Widget build(BuildContext context) {
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
            controller: controller,
            keyboardType: keyboard,
            validator: (v) => validate(v),
            obscureText: obscured,
            obscuringCharacter: "*",
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(input))],
            cursorColor: ColorUtils.grey6F,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(3.w),
              errorStyle: FontTextStyle.errorStyle,
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                  vertical: 1.4.h,
                ),
                child: SizedBox(
                  height: 2.h,
                  width: 2.w,
                  child: Image.asset(
                    icon,
                    color: ColorUtils.grey6F,
                    fit: BoxFit.contain,
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

class CommonContactField extends StatelessWidget {
  const CommonContactField({
    Key? key,
    this.icon,
    this.controller,
    this.keyboard,
    this.typeText,
  }) : super(key: key);
  final controller, icon, keyboard, typeText;

  @override
  Widget build(BuildContext context) {
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
          IntlPhoneField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[0-9]"))
            ],
            keyboardType: keyboard,
            decoration: InputDecoration(
              counterText: '',
              contentPadding: EdgeInsets.all(3.w),
              errorStyle: FontTextStyle.errorStyle,
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                  vertical: 1.4.h,
                ),
                child: SizedBox(
                  height: 2.h,
                  width: 2.w,
                  child: Image.asset(
                    icon,
                    color: ColorUtils.grey6F,
                    fit: BoxFit.contain,
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

class UpdateTextField extends StatelessWidget {
  const UpdateTextField({
    Key? key,
    this.typeText,
    this.controller,
    this.validate,
    this.keyboard,
    this.icon,
    this.input,
  }) : super(key: key);
  final controller, typeText, validate, keyboard, icon, input;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizeConfig.sH3,
        Text(
          typeText,
          style: FontTextStyle.emailAddresStyle,
        ),
        SizeConfig.sH05,
        TextFormField(
          controller: controller,
          keyboardType: keyboard,
          validator: (v) => validate(v),
          cursorColor: ColorUtils.grey6F,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(input))],
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(3.w),
            errorStyle: FontTextStyle.errorStyle,
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

class ReviewTextField extends StatelessWidget {
  const ReviewTextField({Key? key, this.controller, this.hintText})
      : super(key: key);
  final controller, hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      child: TextFormField(
        controller: controller,
        style: FontTextStyle.inputText,
        textInputAction: TextInputAction.done,
        maxLines: 9,
        decoration: InputDecoration(
          filled: true,
          hintText: hintText,
          fillColor: ColorUtils.white,
          errorStyle: FontTextStyle.errorStyle,
          hintStyle: FontTextStyle.hinttextStyle,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorUtils.lightBlue2EE),
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorUtils.lightBlue2EE),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
