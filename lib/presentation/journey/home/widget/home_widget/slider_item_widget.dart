import 'package:flutter/material.dart';

class SliderItemWidget extends StatelessWidget {
  const SliderItemWidget({Key? key, required this.width, required this.imgLink})
      : super(key: key);
  final double width;
  final String imgLink;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(4),
      width: width / 1.2,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: Colors.black,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imgLink),
        ),
      ),
    );
  }
}