import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/images.dart';
import 'package:movie_app/common/constant/strings.dart';
import 'package:movie_app/database/model/model/movie_model.dart';
import 'package:movie_app/database/model/movie.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/widget/full_screen_img_widget.dart';

class ScreenshotSliderWidget extends StatelessWidget {
  const ScreenshotSliderWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.movie,
  }) : super(key: key);

  final double height;
  final double width;
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemBuilder: (_, index) {
          return Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => FullScreenImgWidget(
                            imgLink: AppStrings.linkImg +
                                '${movie.backdrop_path}',
                          )));
                },
                child: Container(
                  margin: const EdgeInsets.all(4).copyWith(top: 8),
                  height: height / 6,
                  width: width / 2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          AppStrings.linkImg + '${movie.backdrop_path}'),
                    ),
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
