import 'package:movie_app/database/model/model/movie_model.dart';
import 'package:movie_app/database/model/movie.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {
  HomeInitState() : super();
}

class HomeOnClickState extends HomeState {
  final bool isClick;
  HomeOnClickState({required this.isClick});
}

class HomeGetAPIState extends HomeState {
  final List<MovieModel> listMovie;
  HomeGetAPIState({required this.listMovie});
}

class HomeLoadingAPIState extends HomeState {}

class HomeErrorMovieApiState extends HomeState {
  final List<MovieModel> listMovie;
  HomeErrorMovieApiState({required this.listMovie});
}

class HomeDoneMovieState extends HomeState {
  final int page;
  final List<MovieModel> listMovie;
  HomeDoneMovieState({required this.page, required this.listMovie});
}

class HomeSliderChangeState extends HomeState {
  final int page;
  final List<MovieModel> listMovie;
  HomeSliderChangeState({required this.listMovie, required this.page});
}

class HomeLoadFromDBState extends HomeState {
  final int page;
  final List<MovieModel>? listMovie;
  HomeLoadFromDBState({this.listMovie, required this.page});
}
