import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_bloc/movie_detail_state.dart';

class CastSliderWidget extends StatelessWidget {
  const CastSliderWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<MovieDetailBloc,MovieDetailState>(
        builder: (context,state) {
          if(state is MovieDetailReadMoreState){
            return ListView.builder(
              itemBuilder: (_, index) {
                return Row(
                  children: [
                    Container(
                              margin: const EdgeInsets.all(2).copyWith(top: 8),
                              height: height/5,
                              width: width/4,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage('http://image.tmdb.org/t/p/w500/${state.cast[index].profile_path}')
                                ),
                              ),
                            ),
                    const SizedBox(width: 8,)
                  ],
                );
              },
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: state.cast.length,
            );
          }else{
            return const CupertinoActivityIndicator(
              animating: true,
              radius: 30,
            );
          }
        }
      ),
      height: height/5,
      width: width/4,
    );
  }
}