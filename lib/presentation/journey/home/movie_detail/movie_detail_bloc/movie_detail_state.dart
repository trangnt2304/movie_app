

import 'package:movie_app/database/model/movie/cast.dart';

abstract class MovieDetailState {}

class MovieDetaiInitState extends MovieDetailState{

  MovieDetaiInitState(): super();

}

class MovieDetailReadMoreState extends MovieDetailState{

  final bool isReadMore;
  final List<Cast> cast ;
  MovieDetailReadMoreState({required this.cast, required this.isReadMore});
}

class MovieDetailLoadingState extends MovieDetailState {
  final List<Cast> cast ;
  MovieDetailLoadingState({required this.cast});
}