import 'package:movie_app/database/model/movie.dart';

abstract class HomeEvent {}

class HomeInitEvent extends HomeEvent {}

class HomeOnClickEvent extends HomeEvent {
  final bool? isClick;

  HomeOnClickEvent({this.isClick});
}

class HomeGetImgEvent extends HomeEvent {
  final List<Movie> listMovie;
  HomeGetImgEvent({required this.listMovie});
}

class HomeLoadingImgEvent extends HomeEvent {
  final List<Movie> listMovie;
  HomeLoadingImgEvent({required this.listMovie});
}

class HomeErrorImgEvent extends HomeEvent {
  final List<Movie> listMovie;
  HomeErrorImgEvent({required this.listMovie});
}

class HomeDoneImgEvent extends HomeEvent {
  final int page;
  final List<Movie>? listMovie;
  HomeDoneImgEvent({required this.page, this.listMovie});
}

class HomeSliderChangeEvent extends HomeEvent {
  final int page;
  final List<Movie>? listMovie;
  HomeSliderChangeEvent({this.listMovie, required this.page});
}
