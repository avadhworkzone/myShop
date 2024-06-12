import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../commanWidget/common_appbar.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/variable_utils.dart';
import '../../../../utils/font_style_utils.dart';
import '../../../../utils/size_config_utils.dart';
import '../../../../commanWidget/custom_btn.dart';
import '../../../../utils/assets/icons_utils.dart';
import '../../../../controllers/change_language_controller.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({Key? key}) : super(key: key);

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  ChangeLanguageController changeLanguageController =
      Get.put(ChangeLanguageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(15.w),
        child: commonAppbar(leadingIcon: IconUtils.backArrrow, onTap: () {
          /// Leading Icon OnTap
          Get.back();
        }, appbarTitle: VariableUtils.changeLanguageText, centerTitle: false),
      ),
      backgroundColor: ColorUtils.lightWhiteBlueFF,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(5.w),
              child: Text(
                VariableUtils.selectLanguageText,
                style: FontTextStyle.accountStyle,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: ColorUtils.white,
              child: Obx(
                () => ListView.builder(
                  itemCount: changeLanguageController.language.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            changeLanguageController.selectLanguage(index);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 4.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                  () => (Text(
                                    changeLanguageController.language[index],
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: changeLanguageController
                                                    .select.value ==
                                                index
                                            ? ColorUtils.primaryColor
                                                .withOpacity(0.9)
                                            : ColorUtils.blue68
                                                .withOpacity(0.9),
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                Obx(() => (Container(
                                      height: 17,
                                      width: 17,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: ColorUtils.lightgreyBA
                                                  .withOpacity(0.5),
                                              width: changeLanguageController
                                                          .select.value ==
                                                      index
                                                  ? 1
                                                  : 2),
                                          color: changeLanguageController
                                                      .select.value ==
                                                  index
                                              ? ColorUtils.primaryColor
                                              : Colors.white),
                                      child: const Icon(
                                        Icons.check,
                                        size: 12,
                                        color: Colors.white,
                                      ),
                                    ))),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1.5,
                          color: ColorUtils.greyCB.withOpacity(0.4),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          SizeConfig.sH2
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 3.w),
            child: CustomBtn(
              onTap: () {},
              bgColor: ColorUtils.primaryColor,
              height: 15.w,
              radius: 7.0,
              style: FontTextStyle.buttonTextColor,
              width: 80.w,
              title: VariableUtils.updateText,
            ),
          ),
        ],
      ),
    );
  }
}
