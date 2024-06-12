import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class RateReviewController extends GetxController {
  RxDouble rateReview = RxDouble(0.0);
  RxDouble editRateReview = RxDouble(0.0);

  final GlobalKey<FormState> rateFormKey = GlobalKey<FormState>();
  TextEditingController reviewController = TextEditingController();
  
  ratingChange(val) {
    rateReview.value = val;
  }

  editRatingChange(val) {
    editRateReview.value = val;
  }
}
