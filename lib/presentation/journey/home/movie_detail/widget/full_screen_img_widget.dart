
import 'package:flutter/material.dart';

class FullScreenImgWidget extends StatelessWidget {
  const FullScreenImgWidget({Key? key, required this.imgLink}) : super(key: key);
  final String imgLink;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      color: Colors.black54,
      child: Image.network(
        imgLink,
        fit: BoxFit.none,
        alignment: Alignment.center,
      ),
    );
  }
}
