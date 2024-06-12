// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_initializing_formals, file_names

import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/color_utils.dart';
import '../../../../../utils/variable_utils.dart';
import '../../../../../commanWidget/custom_btn.dart';
import '../../../../../utils/font_style_utils.dart';
import '../../../../../utils/size_config_utils.dart';

class PendingOrder extends StatefulWidget {
  const PendingOrder({Key? key}) : super(key: key);

  @override
  State<PendingOrder> createState() => _PendingOrderState();
}

class _PendingOrderState extends State<PendingOrder> {
  final List<String> titles = [
    "Pending",
    "Confirm",
    "Out for Delivered \nReady to Pickup",
    "Deliverd",
  ];
  final List<String> titlesdata = [
    "26-7-20",
    "26-7-20",
    "26-7-20",
    "26-7-20",
  ];
  // ignore: prefer_final_fields
  int _curStep = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          child: Column(
            children: [
              Container(
                color: ColorUtils.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(2.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${VariableUtils.orderIdText}\nKJC123456",
                            textAlign: TextAlign.left,
                            style: FontTextStyle.orderIdStyle,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "${VariableUtils.placeOnText}\nJuly 24, 2020",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: ColorUtils.greyB8,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.right,
                            "${VariableUtils.timeText}\n11:30 - 13:00",
                            style: FontTextStyle.orderIdStyle,
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "\$399.00",
                                  textAlign: TextAlign.left,
                                  style: FontTextStyle.amountTextStyle,
                                ),
                                SizeConfig.sH2,
                                Text(
                                  textAlign: TextAlign.left,
                                  "${VariableUtils.trackingStatusOnText}\nJuly 16, 2022",
                                  style: FontTextStyle.trackingStatusStyle,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  VariableUtils.paymentSuccessText,
                                  textAlign: TextAlign.left,
                                  style: FontTextStyle.paymentSuccessStyle,
                                ),
                                SizeConfig.sH2,
                                Text(
                                  textAlign: TextAlign.right,
                                  "${VariableUtils.trackingStatusOnText}\nJuly 16, 2022",
                                  style: FontTextStyle.trackingStatusStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: CustomBtn(
                        onTap: () {},
                        radius: 5,
                        title: VariableUtils.pendingText.toUpperCase(),
                        bgColor: ColorUtils.primaryColor,
                        style: FontTextStyle.buttonTitleStyle
                            .copyWith(fontSize: 14.sp),
                      ),
                    ),
                    SizeConfig.sH2,
                  ],
                ),
              ),
              SizeConfig.sH1,
              Container(
                color: ColorUtils.lightWhiteBlueFF,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StepProgressView(
                        width: MediaQuery.of(context).size.width,
                        curStep: _curStep,
                        color: ColorUtils.pink69,
                        titles: titles,
                        datetitles: titlesdata,
                      ),
                    ),
                    SizeConfig.sH1,
                  ],
                ),
              ),
              Container(
                color: ColorUtils.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "${VariableUtils.orderIdText}\nKJC123456",
                              textAlign: TextAlign.left,
                              style: FontTextStyle.orderIdStyle,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              textAlign: TextAlign.center,
                              "${VariableUtils.placeOnText}\nJuly 24, 2020",
                              style: FontTextStyle.orderIdStyle,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.right,
                              "${VariableUtils.timeText}\n11:30 - 13:00",
                              style: FontTextStyle.orderIdStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "\$399.00",
                                  textAlign: TextAlign.left,
                                  style: FontTextStyle.amountTextStyle,
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Text(
                                  textAlign: TextAlign.left,
                                  "${VariableUtils.trackingStatusOnText}\nJuly 16, 2022",
                                  style: FontTextStyle.trackingStatusStyle,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  VariableUtils.paymentSuccessText,
                                  textAlign: TextAlign.left,
                                  style: FontTextStyle.paymentSuccessStyle,
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Text(
                                  textAlign: TextAlign.right,
                                  "${VariableUtils.trackingStatusOnText}\nJuly 16, 2022",
                                  style: FontTextStyle.trackingStatusStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: CustomBtn(
                        onTap: () {},
                        radius: 5,
                        title: VariableUtils.cancelLowerCaseText.toUpperCase(),
                        bgColor: ColorUtils.pink69,
                        style: FontTextStyle.buttonTitleStyle
                            .copyWith(fontSize: 14.sp),
                      ),
                    ),
                    SizeConfig.sH1,
                  ],
                ),
              ),
              SizeConfig.sH1,
              Container(
                color: ColorUtils.lightWhiteBlueFF,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StepProgressView(
                    width: MediaQuery.of(context).size.width,
                    curStep: _curStep,
                    color: ColorUtils.pink69,
                    titles: titles,
                    datetitles: titlesdata,
                  ),
                ),
              ),
              SizeConfig.sH1,
            ],
          ),
        ),
      ),
    );
  }
}

class StepProgressView extends StatelessWidget {
  final double _width;

  final List<String> _titles;
  final List<String> datetitles;
  final int _curStep;
  final Color _activeColor;
  final Color _inactiveColor = Colors.grey;
  final double lineWidth = 3.0;

  StepProgressView({
    required int curStep,
    required List<String> titles,
    required List<String> datetitles,
    required double width,
    required Color color,
  })  : _titles = titles,
        datetitles = datetitles,
        _curStep = curStep,
        _width = width,
        _activeColor = color,
        assert(width > 0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: _width,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _titleViews(),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: _iconViews(),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _titleDate(),
            ),
          ],
        ));
  }

  List<Widget> _iconViews() {
    var list = <Widget>[];
    _titles.asMap().forEach(
      (i, icon) {
        var circleColor =
            (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;
        var lineColor = _curStep > i + 1 ? _activeColor : _inactiveColor;
        var iconColor =
            (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;

        list.add(
          Container(
            width: 20.0,
            height: 20.0,
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              /* color: circleColor,*/
              borderRadius: const BorderRadius.all(Radius.circular(22.0)),
              border: Border.all(
                color: circleColor,
                width: 2.0,
              ),
            ),
            child: Icon(
              Icons.circle,
              color: iconColor,
              size: 12.0,
            ),
          ),
        );

        //line between icons
        if (i != _titles.length - 1) {
          list.add(
            Expanded(
              child: Container(
                height: lineWidth,
                color: lineColor,
              ),
            ),
          );
        }
      },
    );

    return list;
  }

  List<Widget> _titleViews() {
    var list = <Widget>[];
    _titles.asMap().forEach(
      (i, text) {
        list.add(
          Text(
            text,
            style: FontTextStyle.featuredButtonStyle.copyWith(
              color: ColorUtils.greyB8,
            ),
          ),
        );
      },
    );
    return list;
  }

  List<Widget> _titleDate() {
    var list = <Widget>[];
    datetitles.asMap().forEach(
      (i, text) {
        list.add(
          Text(
            text,
            style: FontTextStyle.featuredButtonStyle.copyWith(
              color: ColorUtils.greyB8,
            ),
          ),
        );
      },
    );
    return list;
  }
}
