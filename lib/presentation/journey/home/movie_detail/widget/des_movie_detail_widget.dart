import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constant/colors.dart';
import 'package:movie_app/common/constant/text_style.dart';
import 'package:movie_app/database/model/movie/movie.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_bloc/movie_detail_event.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_bloc/movie_detail_state.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/widget/cast_slider_widget.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/widget/screenshots_slider_widget.dart';
import 'package:movie_app/presentation/journey/home/widget/home_widget/ticket_button_widget.dart';

class DescriptionMovieDetailWidget extends StatelessWidget {
  const DescriptionMovieDetailWidget({
    Key? key,
    required this.height,
    required this.width, required this.movie,
  }) : super(key: key);

  final double height;
  final double width;
  final Movie movie;


  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: height / 2.5,
      child: Container(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
            builder: (context, state) {
              bool isReadMore = false;
              if (state is MovieDetailReadMoreState) {
                isReadMore = state.isReadMore;
              }
              return MediaQuery.removePadding(
                removeTop:  true,
                context: context,
                child: ListView(
                  children: [
                    Text(
                      "${movie.overview ?? ''}",
                      style: AppTextStyle.movieRateSub,
                      maxLines: isReadMore ? null : 3,
                      overflow: isReadMore
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        context
                            .read<MovieDetailBloc>()
                            .add(MovieDetailChangeReadMoreEvent());
                      },
                      child: Row(
                        children: [
                          Text(
                            isReadMore ? "Readless" : "Readmore",
                            style: AppTextStyle.movieRateSub
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Color(AppColors.white),
                          ),
                        ],
                      ),
                    ),
                    const Align(
                      child: TicketButtonWidget(
                        colorButton: AppColors.background,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Screenshots',
                      style: AppTextStyle.movieRateTile,
                    ),
                    ScreenshotSliderWidget(height: height, width: width, movie: movie,),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Cast',
                      style: AppTextStyle.movieRateTile,
                    ),
                    CastSliderWidget(height: height, width: width),
                  ],
                ),
              );
            },
          )),
    );
  }
}


