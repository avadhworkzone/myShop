import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/modal/apiModel/request_model/get_all_product_list_req_model.dart';
import 'package:my_shop/modal/apis/api_response.dart';
import 'package:my_shop/utils/shared_preference_utils.dart';
import 'package:my_shop/utils/variable_utils.dart';
import 'package:my_shop/utils/size_config_utils.dart';
import 'package:my_shop/utils/assets/icons_utils.dart';
import 'package:my_shop/controllers/trading_serching_controller.dart';
import 'package:my_shop/view/general/bottombar_screens/card/shopping_cart.dart';
import 'package:my_shop/viewModel/cart_view_model.dart';
import 'package:my_shop/viewModel/get_all_product_list_view_model.dart';
import 'package:sizer/sizer.dart';
import '../../../../modal/apiModel/response_model/get_all_product_list_res_model.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/decoration_utils.dart';
import '../../../../utils/font_style_utils.dart';
import '../bottombar_screen.dart';
import 'food_screen_08.dart';

// ignore: camel_case_types
class Trading_Serching extends StatefulWidget {
   Trading_Serching({Key? key,this.isBottomNavigation}) : super(key: key);

  bool? isBottomNavigation;
  @override
  _Trading_SerchingState createState() => _Trading_SerchingState();
}

// ignore: camel_case_types
class _Trading_SerchingState extends State<Trading_Serching> {
  GetAllProductListAndCategoryListViewModel
      getAllProductListAndCategoryListViewModel = Get.find();
  GetAllProductListReqModel getAllProductListReqModel =
      GetAllProductListReqModel();
  CartViewModel cartViewModel = Get.find();

  @override
  initState() {
    allProductData();
    super.initState();
  }

  String? name;
  Future allProductData() async {
    getAllProductListReqModel.userId = PreferenceUtils.getUserId();
    getAllProductListReqModel.type = "All";
    getAllProductListReqModel.orderBy = "price_low";
    await getAllProductListAndCategoryListViewModel
        .getAllProductListDataViewModel(getAllProductListReqModel);
  }

  TradingSearchingController tradingSearchingController =
      Get.put(TradingSearchingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 25.w,
            width: double.infinity,
            decoration: DecorationUtils.appbarDecorationDecoration(),
            child: Container(
              margin: EdgeInsets.only(top: 4.w),
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.isBottomNavigation==true?SizedBox():InkWell(
                      onTap: () {
                        bottombarController.selectedIndex.value=0;
                        Get.offAll(BottomScreen());
                      },
                      child: IconUtils.backArrrow),
                  SizeConfig.sW4,
                  Expanded(
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      cursorColor: ColorUtils.white,
                      style: FontTextStyle.searchHintStyle,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        getAllProductListAndCategoryListViewModel
                            .searchProduct = value;
                        getAllProductListAndCategoryListViewModel.update();
                      },
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: ColorUtils.white)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: ColorUtils.white)),
                        hintStyle: FontTextStyle.searchHintStyle,
                        hintText: VariableUtils.searchForProductsText,
                      ),
                    ),
                  ),
                  SizeConfig.sW1,
                  // InkWell(
                  //   onTap: () {
                  //     // tradingSearchingController.isListening.value;
                  //     tradingSearchingController.listen();
                  //     print(tradingSearchingController.isListening.value);
                  //   },
                  //   child: IconUtils.searchbarmickicon,
                  // ),
                  // SizeConfig.sW1,
                  Stack(
                    children: <Widget>[
                      IconButton(
                        icon: IconUtils.shoppingCarticon,
                        onPressed: () {

                        },
                      ),
                      Positioned(
                        right: 1.w,
                        top: 2.w,
                        child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: DecorationUtils
                                .ordershoppingcounterDecoration(),
                            constraints: DecorationUtils
                                .ordershoppingcounterBoxContain(),
                            child: GetBuilder<CartViewModel>(
                                builder: (controller) {
                                  int total = 0;
                                  controller.addToCartLocalData.forEach((element) {
                                    int qty = element["qty"];
                                    total += qty;
                                  });
                                  return Text(
                                    '${total}',
                                    style: FontTextStyle.displayordercounterStyle,
                                    textAlign: TextAlign.center,
                                  );
                                })),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            height: 9.w,
            alignment: Alignment.centerLeft,
            width: double.infinity,
            decoration: DecorationUtils.trendingSearchTextDecoration(),
            child: Text(
              VariableUtils.trendingSearchesText,
              style: FontTextStyle.trendingSearchStyle,
            ),
          ),
          Expanded(
            child: GetBuilder<GetAllProductListAndCategoryListViewModel>(
              builder: (controller) {
                if (controller.getAllProductListDataApiResponse.status ==
                    Status.LOADING) {
                  return Center(child: const CircularProgressIndicator());
                }
                if (controller.getAllProductListDataApiResponse.status ==
                    Status.ERROR) {
                  const Text('error');
                }
                GetAllProductListResModel allProductDataResponse =
                    controller.getAllProductListDataApiResponse.data;
                return ListView.builder(
                  itemCount: allProductDataResponse.data!.length,
                  itemBuilder: (context, int index) {
                    final data = allProductDataResponse.data![index];
                    if (!data.product!.toLowerCase().contains(
                        controller.searchProduct.toLowerCase())) {
                      return SizedBox();
                    }
                    return Column(
                      // key: ValueKey(_foundUsers[index]["id"]),
                      children: [
                        ListTile(
                          onTap: () {
                            Get.to(() => const Food_Screen());
                          },
                          hoverColor: Colors.red,
                          leading: FadeInImage(
                            placeholder: NetworkImage(
                              allProductDataResponse.data![index].img1!,
                            ),
                            imageErrorBuilder: (context, error, stack) {
                              return SizedBox(
                                // width: 15.w,
                                child: Image.asset(
                                  "assets/icons/no-image-found.png",
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                            image: NetworkImage(
                              allProductDataResponse.data![index].img1!,
                            ),
                            fit: BoxFit.fill,
                            // height: 15.w,
                          ),
                          // _foundUsers[index]["images"],
                          title: Text(
                            allProductDataResponse.data![index].product!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: FontTextStyle.listTileStyle,
                          ),
                        ),
                        DecorationUtils.dividerline2(),

                      ],
                    );
                  },
                );
              },
            ),
          ),
          

          // : Column(
          //     children: [
          //       SizeConfig.sH40,
          //       Center(
          //         child: Text(
          //           VariableUtils.noResultsFoundText,
          //           style: FontTextStyle.noResultFoundStyle,
          //         ),
          //       ),
          //     ],
          //   )
        ],
      ),
    );
  }
}
