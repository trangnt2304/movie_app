import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/colors.dart';

class NowShowingWidget extends StatelessWidget {
  const NowShowingWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
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
                    color: Colors.black),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text('Movie name'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [Text('7.0'), Text('IMDB')],
              ),
              Column(
                children: [Text('7.0'), Text('IMDB')],
              ),
              Column(
                children: [Text('7.0'), Text('IMDB')],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ElevatedButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('Buy ticket'),
          ),
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(AppColors.background)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
