import 'package:flutter/material.dart';
import 'package:movie_app/database/model/movie/movie.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {
  HomeInitState() : super();
}

class HomeOnClickState extends HomeState {
  final bool isClick;
  HomeOnClickState({required this.isClick});
}

class HomeGetImgState extends HomeState {
  final List<Movie> listMovie;
  HomeGetImgState({required this.listMovie});
}

class HomeLoadingImgState extends HomeState {
  final List<Movie> listMovie;
  HomeLoadingImgState({required this.listMovie});
}

class HomeErrorImgState extends HomeState {
  final List<Movie> listMovie;
  HomeErrorImgState({required this.listMovie});
}

class HomeDoneImgState extends HomeState {
  final int page;
  final List<Movie> listMovie;
  final Icon? customIcon;
  final Widget? customSearchBar;
  HomeDoneImgState(
      {this.customIcon,
      this.customSearchBar,
      required this.page,
      required this.listMovie});
}

class HomeSliderChangeState extends HomeState {
  final int page;
  final List<Movie> listMovie;
  HomeSliderChangeState({required this.listMovie, required this.page});
}
