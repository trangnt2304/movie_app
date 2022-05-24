import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/colors.dart';

class AppTextStyle {
  static const movieTitle = TextStyle(
      color: Color(AppColors.white), fontSize: 24, fontWeight: FontWeight.bold);
  static const movieRateTile = TextStyle(
      color: Color(AppColors.white), fontSize: 18, fontWeight: FontWeight.bold);
  static const movieRateSub =
      TextStyle(color: Color(AppColors.movieSubTitle), fontSize: 14);
}
