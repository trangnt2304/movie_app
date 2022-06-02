import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constant/strings.dart';
import 'package:movie_app/database/model/model/movie_model.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_bloc/movie_detail_state.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/widget/full_screen_img_widget.dart';

class CastSliderWidget extends StatelessWidget {
  const CastSliderWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.movie,
  }) : super(key: key);

  final double height;
  final double width;
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
        if (state is MovieDetailDoneLoadingCastState) {
          final cast = state.listCast;
          return ListView.builder(
            itemBuilder: (_, index) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => FullScreenImgWidget(
                                imgLink: AppStrings.linkImg +
                                    '${cast[index].profile_path}',
                              )));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(2).copyWith(top: 8),
                      height: height / 5,
                      width: width / 4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(AppStrings.linkImg +
                              '${cast[index].profile_path}'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  )
                ],
              );
            },
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: cast.length,
          );
        } else {
          return SizedBox(
            height: height / 5,
            child: const CupertinoActivityIndicator(
              animating: true,
              radius: 30,
            ),
          );
        }
      }),
      height: height / 5,
      width: width / 4,
    );
  }
}
