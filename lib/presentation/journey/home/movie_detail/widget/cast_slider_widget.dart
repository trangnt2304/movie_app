import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/images.dart';

class CastSliderWidget extends StatelessWidget {
  const CastSliderWidget({
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
                margin: const EdgeInsets.all(2).copyWith(top: 8),
                height: height/5,
                width: width/4,
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
      height: height/5,
      width: width/4,
    );
  }
}