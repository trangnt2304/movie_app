import 'package:flutter/material.dart';
import 'package:movie_app/database/model/movie/movie.dart';

class ScreenshotSliderWidget extends StatelessWidget {
  const ScreenshotSliderWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.movie,
  }) : super(key: key);

  final double height;
  final double width;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemBuilder: (_, index) {
          return Row(
            children: [
              Container(
                margin: const EdgeInsets.all(4).copyWith(top: 8),
                height: height / 6,
                width: width / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'http://image.tmdb.org/t/p/w500/${movie.backdrop_path}'),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              )
            ],
          );
        },
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 4,
      ),
      height: height / 6,
      width: width / 2,
    );
  }
}
