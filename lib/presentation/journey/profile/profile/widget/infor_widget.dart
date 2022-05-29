import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/colors.dart';

class InforWidget extends StatelessWidget {
  const InforWidget({Key? key, required this.width, this.title})
      : super(key: key);
  final double width;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: const Color(AppColors.movieSubTitle),
          border: Border.all(color: Colors.black45),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Text(
        title ?? '',
        style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
      ),
    );
  }
}