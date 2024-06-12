// ignore_for_file: prefer_const_constructors

import 'past_order.dart';
import 'panding_order.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/color_utils.dart';
import '../../../../../utils/assets/icons_utils.dart';
import '../../../../../utils/font_style_utils.dart';


class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> with SingleTickerProviderStateMixin {
  // TabController? _tabController;
  // @override
  // void initState() {
  //   _tabController = TabController(length: 2, vsync: this);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorUtils.lightWhiteBlueFF,
        appBar: AppBar(
          backgroundColor: ColorUtils.primaryColor,
          elevation: 2.0,
          title: const Text('My Order'),
          leading: InkWell(
            highlightColor: ColorUtils.transparent,
            splashColor: ColorUtils.transparent,
            onTap: () {
              Get.back();
            },
            child: IconUtils.backArrow,
          ),
          bottom: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 1.5.w,
                color: ColorUtils.white,
              ),
            ),
            tabs: [
              Tab(
                child: Text(
                  'Pending Order',
                  style: FontTextStyle.pendingOrderStyle,
                ),
              ),
              Tab(
                child: Text(
                  'Past Order',
                  style: FontTextStyle.pendingOrderStyle,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const PendingOrder(),
            const PostOrder(),
          ],
        ),
      ),
    );
  }
}
