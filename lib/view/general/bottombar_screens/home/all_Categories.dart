// ignore_for_file: must_be_immutable, file_names

import 'package:get/get.dart';
import 'package:my_shop/viewModel/get_all_product_list_view_model.dart';
import '../../../../modal/apiModel/request_model/get_category_list_req_model.dart';
import '../../../../modal/apiModel/response_model/get_category_list_res_model.dart';
import '../../../../modal/apis/api_response.dart';
import '../../../../viewModel/get_category_list_view_model.dart';
import '../bottombar_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/variable_utils.dart';
import '../../../../utils/font_style_utils.dart';
import '../../../../utils/size_config_utils.dart';
import '../../../../utils/assets/icons_utils.dart';
import '../../../../utils/assets/images_utils.dart';
import '../../../../commanWidget/common_appbar.dart';
import 'featured_product.dart';

class AllCategories extends StatelessWidget {
  AllCategories({Key? key}) : super(key: key);

  GetAllProductListAndCategoryListViewModel
      getAllProductListAndCategoryListViewModel = Get.find();

  GetCategoryListReqModel getCategoryListReqModel = GetCategoryListReqModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(15.w),
        child: commonAppbar(leadingIcon: IconUtils.backArrrow, onTap: () {
          /// Leading Icon OnTap
          // Get.offAll(() => BottomScreen());
          Get.back();
        }, appbarTitle: VariableUtils.allCategoriesText, centerTitle: false),
      ),
      body: Column(
        children: [
          GetBuilder<GetAllProductListAndCategoryListViewModel>(
            builder: (getCategoryListController) {
              if (getCategoryListController.getCategoryListApiResponse.status ==
                  Status.LOADING) {
                return const Center(child: CircularProgressIndicator());
              }
              if (getCategoryListController.getCategoryListApiResponse.status ==
                  Status.ERROR) {
                const Text('error');
              }
              GetCategoryListResModel response =
                  getCategoryListController.getCategoryListApiResponse.data;
              return Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(0.w),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2),
                  scrollDirection: Axis.vertical,
                  // shrinkWrap: true,
                  itemCount: response.data!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => FeaturedProduct(
                              category_id: response.data![index].id,
                              category_name: response.data![index].name,
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorUtils.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: FadeInImage(
                                placeholder: NetworkImage(
                                  response.data![index].image!,
                                ),
                                imageErrorBuilder: (context, error, stack) {
                                  return SizedBox(
                                    width: 15.w,
                                    child: Image.asset(
                                      "assets/icons/no-image-found.png",
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                                image: NetworkImage(
                                  response.data![index].image!,
                                ),
                                fit: BoxFit.cover,
                                height: 15.w,
                              ),
                            ),
                            SizeConfig.sH1,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Container(
                                alignment: Alignment.center,
                                height: 5.w,
                                child: Text(
                                  '${response.data![index].name}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: FontTextStyle.categoriesStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
    // BottomScreen();
  }
}
