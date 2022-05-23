import 'package:flutter/material.dart';

class NowShowingWidget extends StatelessWidget {
  const NowShowingWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          color: Colors.red,
          child: Text('Page'),
        ),
      ],
    );
  }
}
