
import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/text_style.dart';

class MovieRateWidget extends StatelessWidget {
  const MovieRateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Fantasy/Mystery',style: AppTextStyle.movieRateSub,),
          SizedBox(width: 8,),
          Text('2 hour',style: AppTextStyle.movieRateSub,)
        ],
      ),
    );
  }
}
