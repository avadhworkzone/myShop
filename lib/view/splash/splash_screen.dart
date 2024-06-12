import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/view/general/bottombar_screens/home/home_screen.dart';
import '../../controllers/splash_controller.dart';
import '../../utils/assets/images_utils.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController splashController = Get.put(SplashController());

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Get.to(()=>HomeScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ImagesWidgets.splashScreenImage,
    );
  }
}
