import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/images.dart';

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
              color: Colors.black,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImages.imgPicHomeScreen),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
