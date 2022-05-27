
import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/text_style.dart';
import 'package:movie_app/database/model/movie/movie.dart';
import 'package:movie_app/presentation/journey/home/widget/home_widget/movie_rate_detail_widget.dart';
import 'package:movie_app/presentation/journey/home/widget/home_widget/movie_rate_widget.dart';

class DetailMovieWidget extends StatelessWidget {
  const DetailMovieWidget({Key? key, required this.height, required this.width, required this.movie}) : super(key: key);
  final Movie movie;

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
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('http://image.tmdb.org/t/p/w500/${movie.poster_path}'),
              ),
            ),
            width: width / 4,
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  movie.title??'',
                  style: AppTextStyle.movieTitle,
                  overflow: TextOverflow.ellipsis,

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
                  children: [
                    MovieRateDetailWidget(
                      rate: "${movie.vote_average ?? ''}",
                      rateTitle: 'IMDB',
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    MovieRateDetailWidget(
                      rate: "${movie.vote_count ?? ''}",
                      rateTitle: 'Vote Count',
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    MovieRateDetailWidget(
                      rate: "${movie.popularity ?? ''}",
                      rateTitle: 'Popularity',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}