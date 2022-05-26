import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/journey/home/home_bloc/home_bloc.dart';
import 'package:movie_app/presentation/journey/home/home_bloc/home_state.dart';
import 'package:movie_app/presentation/journey/home/widget/home_widget/slider_item_widget.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.onPageChanged,
  }) : super(key: key);

  final double height;
  final double width;
  final Function(int) onPageChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is HomeDoneImgState) {
          return CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (page, reason) {
                onPageChanged(page);
              },
              aspectRatio: 2,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.7,
              height: height / 2,
            ),
            items: List.generate(state.listMovie.length, (index) {
              return SliderItemWidget(
                width: width,
                imgLink:
                    'http://image.tmdb.org/t/p/w500/${state.listMovie[index].poster_path}',
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
