
import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/images.dart';
import 'package:movie_app/common/constant/text_style.dart';
import 'package:movie_app/presentation/journey/home/widget/home_widget/movie_rate_detail_widget.dart';
import 'package:movie_app/presentation/journey/home/widget/home_widget/movie_rate_widget.dart';

class DetailMovieWidget extends StatelessWidget {
  const DetailMovieWidget({Key? key, required this.height, required this.width}) : super(key: key);

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8).copyWith(left: 16),
      width: width,
      height: height / 5,
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImages.imgPicHomeScreen),
              ),
            ),
            width: width / 4,
          ),
          const SizedBox(
            width: 24,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Trang meo meo',
                style: AppTextStyle.movieTitle,
              ),
              const SizedBox(
                height: 8,
              ),
              const MovieRateWidget(),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  MovieRateDetailWidget(
                    rate: '7.0',
                    rateTitle: 'IMDB',
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  MovieRateDetailWidget(
                    rate: '87%',
                    rateTitle: 'RottenTomato',
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  MovieRateDetailWidget(
                    rate: '79%',
                    rateTitle: 'Metacritic',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}