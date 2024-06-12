import 'package:get/get.dart';
import 'package:my_shop/view/splash/splash_screen.dart';
import 'package:my_shop/viewModel/auth_viewmodel.dart';
import 'package:my_shop/viewModel/cart_view_model.dart';
import 'package:my_shop/viewModel/get_all_product_list_view_model.dart';
import 'package:my_shop/viewModel/get_product_info_view_model.dart';
import 'package:my_shop/viewModel/get_product_list_view_model.dart';
import 'package:my_shop/viewModel/wishlist_view_model.dart';
import 'controllers/bottom_bar_controller.dart';
import 'controllers/delivery_controller.dart';
import 'nointernet_screen.dart';
import 'package:sizer/sizer.dart';
import '../../utils/color_utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'viewModel/connectivity_view_model.dart';
import 'package:my_shop/utils/variable_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    connectivityViewModel.startMonitoring();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          theme: ThemeData(
            progressIndicatorTheme: const ProgressIndicatorThemeData(
              color: ColorUtils.primaryColor,
            ),
            fontFamily: 'Neusa',
            // ignore: deprecated_member_use
            accentColor: ColorUtils.primaryColor,
          ),
          title: VariableUtils.myShopText,
          debugShowCheckedModeBanner: false,
          smartManagement: SmartManagement.full,
          home: GetBuilder<ConnectivityViewModel>(
            builder: (connectivityViewModel) {
              if (connectivityViewModel.isOnline != null) {
                if (connectivityViewModel.isOnline!) {
                  return SplashScreen();
                  // PreferenceUtils.getLogin() == 0
                  //   ? SplashScreen()
                  // ? const SignIn()
                  // : SplashScreen();
                  // : BottomScreen();
                } else {
                  return const NoInterNetConnected();
                }
              } else {
                return const SizedBox();
              }
            },
          ),
        );
      },
    );
  }

  BottombarController bottombarController = Get.put(BottombarController());

  ConnectivityViewModel connectivityViewModel =
      Get.put(ConnectivityViewModel());

  AuthViewModel authViewModel = Get.put(AuthViewModel());

  DeliveryController deliveryController = Get.put(DeliveryController());

  GetAllProductListAndCategoryListViewModel
      getAllProductListAndCategoryListViewModel =
      Get.put(GetAllProductListAndCategoryListViewModel());

  GetProductListViewModel getProductListViewModel =
      Get.put(GetProductListViewModel());

  WishListViewModel wishListViewModel = Get.put(WishListViewModel());

  CartViewModel cartViewModel = Get.put(CartViewModel());

  GetProductInfoViewModel getProductInfoViewModel =
      Get.put(GetProductInfoViewModel());
}
