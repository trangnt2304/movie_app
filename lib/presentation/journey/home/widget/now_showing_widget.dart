import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constant/colors.dart';
import 'package:movie_app/common/constant/text_style.dart';
import 'package:movie_app/presentation/journey/home/home_bloc/home_bloc.dart';
import 'package:movie_app/presentation/journey/home/home_bloc/home_event.dart';
import 'package:movie_app/presentation/journey/home/home_bloc/home_state.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_widget.dart';
import 'package:movie_app/presentation/journey/home/widget/home_widget/movie_rate_widget.dart';
import 'package:movie_app/presentation/journey/home/widget/home_widget/movie_rate_detail_widget.dart';
import 'package:movie_app/presentation/journey/home/widget/home_widget/slider_widget.dart';
import 'package:movie_app/presentation/journey/home/widget/home_widget/ticket_button_widget.dart';

class NowShowingWidget extends StatelessWidget {
  const NowShowingWidget({
    Key? key,
    required this.controller,
    required this.onPageChanged,
  }) : super(key: key);

  final PageController controller;
  final Function(int) onPageChanged;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(AppColors.background),
          Color(AppColors.chineseBlue),
        ], begin: Alignment.topRight, end: Alignment.bottomRight),
      ),
      child: Column(
        children: [
          SliderWidget(
            height: height,
            width: width,
            onPageChanged: (int page) {
              onPageChanged(page);
            },
          ),
          const SizedBox(
            height: 4,
          ),
          BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            if (state is HomeDoneImgState) {
              return Text(
                state.listMovie[state.page].title ?? '',
                textAlign: TextAlign.center,
                style: AppTextStyle.movieTitle,
              );
            } else {
              return const Text(
                '',
                style: AppTextStyle.movieTitle,
              );
            }
          }),
          const SizedBox(
            height: 4,
          ),
          const MovieRateWidget(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
            child: BlocBuilder<HomeBloc,HomeState>(
              builder: (context,state) {
                if(state is HomeDoneImgState){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MovieRateDetailWidget(
                      rate: '${state.listMovie[state.page].vote_average}',
                      rateTitle: 'IMDB',
                    ),
                    MovieRateDetailWidget(
                      rate: '${state.listMovie[state.page].vote_count}',
                      rateTitle: 'Vote Count',
                    ),
                    MovieRateDetailWidget(
                      rate: '${state.listMovie[state.page].popularity}',
                      rateTitle: 'Popularity',
                    ),
                  ],
                );}else{
                  return const CupertinoActivityIndicator(
                    animating: true,
                    radius: 30,
                  );
                }
              }
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if(state is HomeDoneImgState){
              return TicketButtonWidget(
                colorButton: AppColors.chineseBlue,
                onPressed: () {
                  context.read<HomeBloc>().add(HomeOnClickEvent());
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => MovieDetailWidget(
                        movie: state.listMovie[state.page],
                      )));
                },
              );}else{
                return Container(
                );
              }
            },
          ),
          const Icon(
            Icons.keyboard_arrow_down_sharp,
            color: Color(AppColors.movieSubTitle),
          ),
        ],
      ),
    );
  }
}
