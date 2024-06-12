// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:get/get.dart';
import 'package:my_shop/utils/font_style_utils.dart';
import 'delivery_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../utils/color_utils.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorUtils.lightWhiteBlueFF,
        appBar: AppBar(
          backgroundColor: ColorUtils.primaryColor,
          elevation: 2.0,
          title: const Text('Checkout'),
          leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back),
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
                  'Delivery',
                  style: FontTextStyle.pendingOrderStyle,
                ),
              ),
              Tab(
                child: Text(
                  'Payment',
                  style: FontTextStyle.pendingOrderStyle,
                ),
              ),
            ],
          ),
        ),
        // ignore: prefer_const_constructors
        body: TabBarView(
          children: [
            const DeliveryScreen(),
            const DeliveryScreen(),
          ],
        ),
      ),
    );
  }
}
