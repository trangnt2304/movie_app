import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/text_style.dart';

class MovieRateDetailWidget extends StatelessWidget {
  const MovieRateDetailWidget({
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
          overflow: TextOverflow.fade,
        ),
        Text(
          rateTitle ?? '',
          style: AppTextStyle.movieRateSub,
          overflow: TextOverflow.fade,
        ),
      ],
    );
  }
}
