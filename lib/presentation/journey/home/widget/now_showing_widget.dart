import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/colors.dart';
import 'package:movie_app/common/constant/text_style.dart';
import 'package:movie_app/presentation/journey/home/widget/home_widget/movie_rate_widget.dart';
import 'package:movie_app/presentation/journey/home/widget/home_widget/movie_rate_detail_widget.dart';
import 'package:movie_app/presentation/journey/home/widget/home_widget/slider_widget.dart';
import 'package:movie_app/presentation/journey/home/widget/home_widget/ticket_button_widget.dart';


class NowShowingWidget extends StatelessWidget {
  const NowShowingWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(AppColors.background),
          Color(AppColors.chineseBlue),
        ],
            begin: Alignment.topRight,
            end: Alignment.bottomRight

        ),
      ),
      child: Column(
        children: [
          SliderWidget(height: height, width: width),
          const SizedBox(
            height: 4,
          ),
          const Text('Trang meo meo',style: AppTextStyle.movieTitle,),
          const SizedBox(
            height: 4,
          ),
          const MovieRateWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                MovieRateDetailWidget(rate: '7.0',rateTitle: 'IMDB',),
                MovieRateDetailWidget(rate: '87%',rateTitle: 'Rotten Tomato',),
                MovieRateDetailWidget(rate: '79%',rateTitle: 'Metacritic',),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const TicketButtonWidget(
            colorButton: AppColors.chineseBlue,
          ),
          const Icon(Icons.keyboard_arrow_down_sharp,color: Color(AppColors.movieSubTitle),),
        ],
      ),
    );
  }
}





