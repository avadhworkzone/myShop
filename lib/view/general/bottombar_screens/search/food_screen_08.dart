// ignore_for_file: camel_case_types

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/variable_utils.dart';
import '../../../../utils/decoration_utils.dart';
import '../../../../utils/font_style_utils.dart';
import '../../../../utils/size_config_utils.dart';
import '../../../../utils/assets/icons_utils.dart';

class Food_Screen extends StatelessWidget {
  const Food_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 65.w,
                width: double.infinity,
                decoration: DecorationUtils.foodsDecoration(),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: IconUtils.backArrrow,
                          ),
                          SizeConfig.sW5,
                          Text(
                            VariableUtils.beveragesText,
                            style: FontTextStyle.foodtextStyle,
                          ),
                          const Spacer(),
                          IconUtils.searchicon,
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 52.w,
            left: 6.w,
            child: Card(
              elevation: 2.0,
              child: Container(
                width: 86.w,
                height: 150.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                  color: ColorUtils.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      commonListTile(VariableUtils.chocolateDrinkText),
                      DecorationUtils.dividerline1(),
                      commonListTile(VariableUtils.coffeeText),
                      DecorationUtils.dividerline1(),
                      commonListTile(VariableUtils.concentratedFruitDrinksText),
                      DecorationUtils.dividerline1(),
                      commonListTile(VariableUtils.juicesCarbonatesText),
                      DecorationUtils.dividerline1(),
                      commonListTile(VariableUtils.maltDrinkText),
                      DecorationUtils.dividerline1(),
                      commonListTile(VariableUtils.milksCreamersText),
                      DecorationUtils.dividerline1(),
                      commonListTile(VariableUtils.rTDBeverages),
                      DecorationUtils.dividerline1(),
                      commonListTile(VariableUtils.sportEnergyDrinksText),
                      DecorationUtils.dividerline1(),
                      commonListTile(VariableUtils.teaText),
                      DecorationUtils.dividerline1(),
                      commonListTile(VariableUtils.watersText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  commonListTile(title) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        title: Text(title),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          size: 4.w,
        ),
      ),
    );
  }
}
