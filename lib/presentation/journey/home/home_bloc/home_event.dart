import 'package:movie_app/database/model/model/movie_model.dart';
import 'package:movie_app/database/model/movie.dart';

abstract class HomeEvent {}

class HomeInitEvent extends HomeEvent {}

class HomeOnClickEvent extends HomeEvent {
  final bool? isClick;

  HomeOnClickEvent({this.isClick});
}

class HomeGetAPIEvent extends HomeEvent {
  final List<MovieJson> listMovie;
  HomeGetAPIEvent({required this.listMovie});
}

class HomeLoadingAPIEvent extends HomeEvent {
  final List<MovieModel>? listMovie;
  HomeLoadingAPIEvent({required this.listMovie});
}

class HomeErrorAPIEvent extends HomeEvent {
  final List<MovieModel>? listMovie;
  HomeErrorAPIEvent({required this.listMovie});
}

class HomeDoneAPIEvent extends HomeEvent {
  final int page;
  final List<MovieModel>? listMovie;
  HomeDoneAPIEvent({required this.page, this.listMovie});
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


