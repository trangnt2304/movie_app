import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/colors.dart';
import 'package:movie_app/presentation/journey/home/widget/cinema_widget.dart';
import 'package:movie_app/presentation/journey/home/widget/comming_soon_widget.dart';
import 'package:movie_app/presentation/journey/home/widget/now_showing_widget.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: Color(AppColors.background),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(AppColors.background),
          title: const Text('TabBar Widget'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Now Showing",
              ),
              Tab(
                text: "Cinema",
              ),
              Tab(
                text: "Coming Soon",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            NowShowingWidget(controller: controller),
            CinemaWidget(),
            CommingSoonWidget(),
          ],
        ),
      ),
    );
  }
}




