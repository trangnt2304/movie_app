import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constant/colors.dart';
import 'package:movie_app/common/constant/images.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/widget/des_movie_detail_widget.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/widget/detail_movie_widget.dart';

class MovieDetailWidget extends StatefulWidget {
  const MovieDetailWidget({Key? key}) : super(key: key);

  @override
  State<MovieDetailWidget> createState() => _MovieDetailWidgetState();
}

class _MovieDetailWidgetState extends State<MovieDetailWidget> {
  late MovieDetailBloc _bloc;

  @override
  void initState() {
    _bloc = MovieDetailBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (_) => _bloc,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              width: width,
              child: Container(
                height: height / 3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppImages.imgPicHomeScreen),
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Color(AppColors.background),
                  Color(AppColors.chineseBlue),
                ], begin: Alignment.topRight, end: Alignment.bottomRight),
              ),
            ),
            Positioned(
              width: width,
              top: height / 5,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.transparent,
                    const Color(AppColors.background).withOpacity(0.9),
                    const Color(0xff7497bf),
                  ], begin: Alignment.topRight, end: Alignment.bottomRight),
                ),
                child: DetailMovieWidget(
                  width: width,
                  height: height,
                ),
              ),
            ),
            DescriptionMovieDetailWidget(height: height, width: width),
          ],
        ),
      ),
    );
  }
}


