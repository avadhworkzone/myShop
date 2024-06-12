import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../utils/variable_utils.dart';
import '../../../../utils/font_style_utils.dart';
import '../../../../utils/assets/icons_utils.dart';
import '../../../../commanWidget/common_appbar.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(15.w),
        child: commonAppbar(leadingIcon: IconUtils.backArrrow, onTap: () {
          /// Leading Icon OnTap
          Get.back();
        }, appbarTitle: VariableUtils.termsAndConditions, centerTitle: false),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.w),
                child: Text(
                  VariableUtils.termsAndConditionsDiscribtionText,
                  style: FontTextStyle.termsAndConditionDiscriptionStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
