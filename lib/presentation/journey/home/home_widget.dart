import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/colors.dart';
import 'package:movie_app/common/constant/icons.dart';
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
        backgroundColor: const Color(AppColors.background),
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset(
              AppIcons.icMenu,
              width: 24,
              height: 24,
            ),
            onPressed: () {},
          ),
          elevation: 0,
          backgroundColor: const Color(AppColors.background),
          title: const Text('Movies'),
          actions: [
            IconButton(
              icon: Image.asset(
                AppIcons.icSearch,
                width: 24,
                height: 24,
              ),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            indicatorPadding: EdgeInsets.symmetric(horizontal: 8),
            indicatorColor: Color(AppColors.movieSubTitle),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
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
            const CinemaWidget(),
            const CommingSoonWidget(),
          ],
        ),
      ),
    );
  }
}
