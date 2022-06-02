import 'package:movie_app/database/model/list/actor.dart';
import 'package:movie_app/database/model/model/movie_model.dart';

abstract class MovieDetailEvent {}

class MovieDetailInitEvent extends MovieDetailEvent {
  final MovieModel movie;

  MovieDetailInitEvent({required this.movie});
}

class MovieDetailChangeReadMoreEvent extends MovieDetailEvent {
  final bool? isReadmore;

  MovieDetailChangeReadMoreEvent({this.isReadmore});
}

class MovieDetailLoadingCastEvent extends MovieDetailEvent {
  MovieDetailLoadingCastEvent();
}

class MovieDetailDoneLoadingCastEvent extends MovieDetailEvent {
  List<Cast>? listCast;
  MovieDetailDoneLoadingCastEvent({this.listCast});
}
