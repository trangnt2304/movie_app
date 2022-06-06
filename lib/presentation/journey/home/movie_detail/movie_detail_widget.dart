import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constant/colors.dart';
import 'package:movie_app/common/constant/strings.dart';
import 'package:movie_app/database/model/model/movie_model.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_bloc/movie_detail_event.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/widget/des_movie_detail_widget.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/widget/detail_movie_widget.dart';

class MovieDetailWidget extends StatefulWidget {
  const MovieDetailWidget({Key? key, required this.movie}) : super(key: key);
  final MovieModel movie;

  @override
  State<MovieDetailWidget> createState() => _MovieDetailWidgetState();
}

class _MovieDetailWidgetState extends State<MovieDetailWidget> {
  late MovieDetailBloc _bloc;

  @override
  void initState() {
    _bloc = MovieDetailBloc();
    _bloc.add(MovieDetailInitEvent(movie: widget.movie));
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        AppStrings.linkImg + widget.movie.backdropPath),
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
              child: DetailMovieWidget(
                movie: widget.movie,
                width: width,
                height: height,
              ),
            ),
            DescriptionMovieDetailWidget(
              height: height,
              width: width,
              onPressed: () {},
              movie: widget.movie,
            ),
          ],
        ),
      ),
    );
  }
}




