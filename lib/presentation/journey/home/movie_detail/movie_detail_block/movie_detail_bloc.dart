

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_block/movie_detail_event.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_block/movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent,MovieDetailState> {

  bool _isReadMore = false;

  MovieDetailBloc(): super(MovieDetaiInitState()) {
    emit(MovieDetailReadMoreState(isReadMore: _isReadMore));
    on<MovieDetailInitEvent>(_onInitEvent);
    on<MovieDetailChangeReadMoreEvent>(_onChangedReadMoreEvent);
  }

  FutureOr<void> _onInitEvent(MovieDetailInitEvent event, Emitter<MovieDetailState> emit) {
    emit(MovieDetailReadMoreState(isReadMore: _isReadMore));
  }

  FutureOr<void> _onChangedReadMoreEvent(MovieDetailChangeReadMoreEvent event, Emitter<MovieDetailState> emit) {
    _isReadMore = !_isReadMore;
    emit(MovieDetailReadMoreState(isReadMore: _isReadMore));
  }
}