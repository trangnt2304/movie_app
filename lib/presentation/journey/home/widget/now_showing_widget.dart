import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/colors.dart';
import 'package:movie_app/common/constant/text_style.dart';
import 'package:movie_app/presentation/journey/home/widget/movie_rate_widget.dart';

import '../../../../generated/l10n.dart';



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
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(

          ),
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.7,
              height: height / 2,
            ),
            items: [
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(4),
                width: width / 1.2,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Colors.black),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text('Movie name',style: AppTextStyle.movieTitle,),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Fantasy/Mystery',style: AppTextStyle.movieRateSub,),
              SizedBox(width: 8,),
              Text('2 hour',style: AppTextStyle.movieRateSub,)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MovieRateWidget(rate: '7.0',rateTitle: 'IMDB',),
              MovieRateWidget(rate: '87%',rateTitle: 'Rotten Tomato',),
              MovieRateWidget(rate: '79%',rateTitle: 'Metacritic',),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ElevatedButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(S().lamthon),
          ),
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(AppColors.background)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: const BorderSide(color: Color(AppColors.white)),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


