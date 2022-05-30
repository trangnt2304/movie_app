import 'package:movie_app/database/local/entity/movie_entity.dart';
import 'package:movie_app/database/model/model/movie_model.dart';
import 'package:movie_app/database/model/movie.dart';

abstract class HomeEvent {}

class HomeInitEvent extends HomeEvent {}

class HomeOnClickEvent extends HomeEvent {
  final bool? isClick;

  HomeOnClickEvent({this.isClick});
}

class HomeGetImgEvent extends HomeEvent {
  final List<MovieJson> listMovie;
  HomeGetImgEvent({required this.listMovie});
}

class HomeLoadingImgEvent extends HomeEvent {
  final List<MovieModel>? listMovie;
  HomeLoadingImgEvent({required this.listMovie});
}

class HomeErrorImgEvent extends HomeEvent {
  final List<MovieModel>? listMovie;
  HomeErrorImgEvent({required this.listMovie});
}

class HomeDoneImgEvent extends HomeEvent {
  final int page;
  final List<MovieModel>? listMovie;
  HomeDoneImgEvent({required this.page, this.listMovie});
}

class HomeSliderChangeEvent extends HomeEvent {
  final int page;
  final List<MovieModel>? listMovie;
  HomeSliderChangeEvent({this.listMovie, required this.page});
}

class HomeLoadFromDBEvent extends HomeEvent {
  final int page;
  final List<MovieModel>? listMovie;
  HomeLoadFromDBEvent({this.listMovie, required this.page});
}