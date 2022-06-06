import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constant/strings.dart';
import 'package:movie_app/presentation/journey/home/home_bloc/home_bloc.dart';
import 'package:movie_app/presentation/journey/home/home_bloc/home_event.dart';
import 'package:movie_app/presentation/journey/home/home_bloc/home_state.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_widget.dart';
import 'package:movie_app/presentation/journey/home/widget/home_widget/slider_item_widget.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is HomeDoneMovieState) {
          return CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (page, reason) {
                context.read<HomeBloc>().add(HomeDoneAPIEvent(
                      page: page,
                      listMovie: [],
                    ));
              },
              aspectRatio: 2,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.7,
              height: height / 2,
            ),
            items: List.generate(state.listMovie.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MovieDetailWidget(
                              movie: state.listMovie[state.page])));
                },
                child: SliderItemWidget(
                  width: width,
                  imgLink:
                      AppStrings.linkImg + state.listMovie[index].posterPath,
                ),
              );
            }),
          );
        } else {
          return SizedBox(
            height: height / 2,
            child: const CupertinoActivityIndicator(
              animating: true,
              radius: 30,
            ),
          );
        }
      }),
    );
  }
}


