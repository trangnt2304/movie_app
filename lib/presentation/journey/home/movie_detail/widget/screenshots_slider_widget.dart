import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/images.dart';

class ScreenshotSliderWidget extends StatelessWidget {
  const ScreenshotSliderWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemBuilder: (_, index) {
          return Row(
            children: [
              Container(
                margin: const EdgeInsets.all(4).copyWith(top: 8),
                height: height/6,
                width: width/2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppImages.imgPicHomeScreen),
                  ),
                ),
              ),
              const SizedBox(width: 8,)
            ],
          );
        },
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 4,
      ),
      height: height/6,
      width: width/2,
    );
  }
}