import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/text_style.dart';

class MovieRateWidget extends StatelessWidget {
  const MovieRateWidget({
    Key? key,
    this.rate,
    this.rateTitle,
  }) : super(key: key);

  final String? rate;
  final String? rateTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          rate ?? '',
          style: AppTextStyle.movieRateTile,
        ),
        Text(
          rateTitle ?? '',
          style: AppTextStyle.movieRateSub,
        ),
      ],
    );
  }
}
