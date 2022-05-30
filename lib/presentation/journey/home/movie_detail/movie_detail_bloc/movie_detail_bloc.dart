

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/database/model/list/actor.dart';
import 'package:movie_app/database/network/client.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_bloc/movie_detail_event.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_bloc/movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent,MovieDetailState> {

  bool _isReadMore = false;
  List<Cast> _listCast = [];
  final client = RestClient(Dio(BaseOptions(contentType: "application/json")));
  int _movieId = 0;

  MovieDetailBloc(): super(MovieDetaiInitState()) {
    emit(MovieDetailReadMoreState(isReadMore: _isReadMore));
    on<MovieDetailInitEvent>(_onInitEvent);
    on<MovieDetailChangeReadMoreEvent>(_onChangedReadMoreEvent);
    on<MovieDetailLoadingCastEvent>(_onLoadingCast);
    on<MovieDetailDoneLoadingCastEvent>(_onDoneLoadingCast);
  }

  FutureOr<void> _onInitEvent(MovieDetailInitEvent event, Emitter<MovieDetailState> emit) {
    emit(MovieDetailReadMoreState(isReadMore: _isReadMore));
    _movieId = event.movie.id;
    loadingCastOnInit();
  }

  FutureOr<void> _onChangedReadMoreEvent(MovieDetailChangeReadMoreEvent event, Emitter<MovieDetailState> emit) {
    _isReadMore = !_isReadMore;
    emit(MovieDetailDoneLoadingCastState(listCast: _listCast, isReadMore: _isReadMore));

  }
  Future<void> loadingCastOnInit() async {
    emit(MovieDetailLoadingCastState());
    final listCast = await client.getCast(_movieId);
    if (listCast.cast != null) {
      _listCast = listCast.cast ?? [];
      emit(MovieDetailDoneLoadingCastState(listCast: _listCast, isReadMore: _isReadMore));

    }
  }
  Future<void> _onLoadingCast(MovieDetailLoadingCastEvent event, Emitter<MovieDetailState> emitter)async {
    emit(MovieDetailLoadingCastState());
  }

  Future<void> _onDoneLoadingCast(MovieDetailDoneLoadingCastEvent event, Emitter<MovieDetailState> emitter)async {
    emit(MovieDetailDoneLoadingCastState(listCast: _listCast, isReadMore: _isReadMore));
  }
}