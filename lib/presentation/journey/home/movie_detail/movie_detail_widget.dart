import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constant/colors.dart';
import 'package:movie_app/common/constant/images.dart';
import 'package:movie_app/common/constant/text_style.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_block/movie_detail_bloc.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_block/movie_detail_event.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_block/movie_detail_state.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/widget/detail_movie_widget.dart';
import 'package:movie_app/presentation/journey/home/widget/home_widget/ticket_button_widget.dart';

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
            Positioned.fill(
              top: height / 3,
              child: Container(
                  padding: const EdgeInsets.all(16),
                  child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
                    builder: (context, state) {
                      String textButton = "";
                      var lines = 3;
                      bool isReadMore = false;
                      if (state is MovieDetailReadMoreState) {
                        isReadMore = state.isReadMore;
                        if (state.isReadMore) {
                          lines = 1;
                          textButton = "Read less";
                        } else {
                          lines = 3;
                          textButton = "Read more";
                        }
                      }
                      return ListView(
                        children: [
                          Text(
                            'Event được truyền vào một Bloc. Nó giống như concept action trong Redux. Trong lớp presentation, event được tạo ra bởi tương tác của user như button click và truyền vào Bloc. Một event có thể bao gồm vài data được thêm vào',
                            style: AppTextStyle.movieRateSub,
                            maxLines: lines,
                            // overflow properties is used to show 3 dot in text widget
                            // so that user can understand there are few more line to read.
                            overflow: isReadMore
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {
                              context
                                  .read<MovieDetailBloc>()
                                  .add(MovieDetailChangeReadMoreEvent());
                            },
                            child: Row(
                              children: [
                                Text(
                                  textButton,
                                  style: AppTextStyle.movieRateSub
                                      .copyWith(color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Color(AppColors.white),
                                ),
                              ],
                            ),
                          ),
                          const Align(
                            child: TicketButtonWidget(
                              colorButton: AppColors.background,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Screenshots',
                            style: AppTextStyle.movieRateTile,
                          ),
                          SizedBox(
                            child: ListView.builder(
                              itemBuilder: (_, index) {
                                return Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(4).copyWith(top: 8),
                                      height: height/6,
                                      width: width/2,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(AppImages.imgPicHomeScreen),
                                        ),
                                      ),
                                      child: Text('alo'),
                                    ),
                                    SizedBox(width: 8,)
                                  ],
                                );
                              },
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 4,
                            ),
                            height: height/6,
                            width: width/2,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Cast',
                            style: AppTextStyle.movieRateTile,
                          ),
                          SizedBox(
                            child: ListView.builder(
                              itemBuilder: (_, index) {
                                return Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(2).copyWith(top: 8),
                                      height: height/5,
                                      width: width/4,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(AppImages.imgPicHomeScreen),
                                        ),
                                      ),
                                      child: Text('alo'),
                                    ),
                                    SizedBox(width: 8,)
                                  ],
                                );
                              },
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 4,
                            ),
                            height: height/5,
                            width: width/4,
                          ),
                        ],
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
