import 'package:movie_app/database/model/list/actor.dart';

abstract class MovieDetailState {}

class MovieDetaiInitState extends MovieDetailState {
  MovieDetaiInitState() : super();
}

class MovieDetailReadMoreState extends MovieDetailState {
  final bool isReadMore;

  MovieDetailReadMoreState({required this.isReadMore});
}

class MovieDetailLoadingCastState extends MovieDetailState {
  MovieDetailLoadingCastState();
}

class MovieDetailDoneLoadingCastState extends MovieDetailState {
  List<Cast> listCast;
  final bool isReadMore;
  MovieDetailDoneLoadingCastState(
      {required this.isReadMore, required this.listCast});
}

