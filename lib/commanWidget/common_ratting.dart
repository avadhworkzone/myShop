// ignore_for_file: prefer_typing_uninitialized_variables

import '../utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

// ignore: must_be_immutable
class CommonRatting extends StatelessWidget {
  CommonRatting({
    Key? key,
    this.ratting,
    this.size,
    this.spaceing,
    required this.rattingChange,
  }) : super(key: key);
  final ratting, size, spaceing;
  Function rattingChange;
  @override
  Widget build(BuildContext context) {
    return SmoothStarRating(
      size: size,
      starCount: 5,
      rating: ratting,
      spacing: spaceing,
      allowHalfRating: true,
      filledIconData: Icons.star,
      color: ColorUtils.yellow41,
      borderColor: ColorUtils.greyE0,
      defaultIconData: Icons.star_border,
      halfFilledIconData: Icons.star_half,
      onRatingChanged: (value) {
        rattingChange(value);
      },
    );
  }
}
