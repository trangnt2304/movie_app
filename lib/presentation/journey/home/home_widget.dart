import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constant/colors.dart';
import 'package:movie_app/common/constant/icons.dart';
import 'package:movie_app/generated/l10n.dart';
import 'package:movie_app/presentation/journey/home/home_bloc/home_bloc.dart';
import 'package:movie_app/presentation/journey/home/widget/cinema_widget.dart';
import 'package:movie_app/presentation/journey/home/widget/comming_soon_widget.dart';
import 'package:movie_app/presentation/journey/home/widget/now_showing_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeBloc _homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: BlocProvider(
        create: (_) => _homeBloc,
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
            bottom: TabBar(
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
              indicatorColor: const Color(AppColors.movieSubTitle),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(
                  text: S().nowShowing,
                ),
                Tab(
                  text: S().cinema,
                ),
                Tab(
                  text: S().comingSoon,
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              NowShowingWidget(),
              CinemaWidget(),
              CommingSoonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

