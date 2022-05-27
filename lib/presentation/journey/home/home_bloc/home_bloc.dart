import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/database/model/movie.dart';
import 'package:movie_app/database/network/client.dart';
import 'package:movie_app/presentation/journey/home/home_bloc/home_event.dart';
import 'package:movie_app/presentation/journey/home/home_bloc/home_state.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  bool _isClick = false;
  List<Movie> _listMovie = [];
  int _page = 0;
  final client = RestClient(Dio(BaseOptions(contentType: "application/json")));

  HomeBloc() : super(HomeInitState()) {
    on<HomeInitEvent>(_onInitEvent);
    on<HomeOnClickEvent>(_onClickEvent);
    on<HomeGetImgEvent>(_getImgEvent);
    on<HomeLoadingImgEvent>(_onLoadingImgApi);
    on<HomeErrorImgEvent>(_onErrorImgApi);
    on<HomeDoneImgEvent>(_onDoneImgApi);
    on<HomeSliderChangeEvent>(_onSliderPageChange);
    loadImgOnInit();
  }

  Future<void> _onInitEvent(
      HomeInitEvent event, Emitter<HomeState> emit) async {
    emit(HomeOnClickState(isClick: _isClick));
  }

  Future<void> _onClickEvent(
      HomeOnClickEvent event, Emitter<HomeState> emmit) async {
    _isClick = !_isClick;
    emit(HomeOnClickState(isClick: _isClick));
  }

  Future<void> _getImgEvent(
      HomeGetImgEvent event, Emitter<HomeState> emit) async {
    emit(HomeGetImgState(listMovie: _listMovie));
  }

  Future<void> _onLoadingImgApi(
      HomeLoadingImgEvent event, Emitter<HomeState> emit) async {
    emit(HomeGetImgState(listMovie: _listMovie));
  }

  Future<void> _onErrorImgApi(
      HomeErrorImgEvent event, Emitter<HomeState> emit) async {
    emit(HomeErrorImgState(listMovie: _listMovie));
  }

  Future<void> _onDoneImgApi(
      HomeDoneImgEvent event, Emitter<HomeState> emit) async {
    emit(HomeDoneImgState(listMovie: _listMovie, page: event.page));
  }

  Future<void> _onSliderPageChange(
      HomeSliderChangeEvent event, Emitter<HomeState> emit) async {
    emit(HomeSliderChangeState(page: _page, listMovie: _listMovie));
  }

  Future<void> loadImgOnInit() async {
    emit(HomeLoadingImgState(listMovie: _listMovie));;
    final check = await client.getMovie();
    if (check.results != null) {
      _listMovie = check.results ?? [];
      emit(HomeDoneImgState(listMovie: _listMovie, page: _page));
    }
  }
}
