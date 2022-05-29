

import 'package:movie_app/database/model/movie/cast.dart';

abstract class MovieDetailEvent{}

class MovieDetailInitEvent extends MovieDetailEvent{}

class MovieDetailChangeReadMoreEvent extends MovieDetailInitEvent {

  final bool? isReadmore;

  MovieDetailChangeReadMoreEvent({this.isReadmore});
}

class MovieDetailLoadingEvent extends MovieDetailEvent {
  final List<Cast> cast ;
  MovieDetailLoadingEvent({required this.cast});
}