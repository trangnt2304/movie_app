

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/database/model/movie/cast.dart';
import 'package:movie_app/database/model/movie/movie.dart';
import 'package:movie_app/database/network/client.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_bloc/movie_detail_event.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_bloc/movie_detail_state.dart';


class MovieDetailBloc extends Bloc<MovieDetailEvent,MovieDetailState> {

  bool _isReadMore = false;
  final Movie movie;
  List<Cast> _cast = [];
  final client = RestClient(Dio(BaseOptions(contentType: "application/json")));

  MovieDetailBloc(this.movie): super(MovieDetaiInitState()) {
    emit(MovieDetailReadMoreState(isReadMore: _isReadMore, cast: _cast));
    on<MovieDetailInitEvent>(_onInitEvent);
    on<MovieDetailChangeReadMoreEvent>(_onChangedReadMoreEvent);
    on<MovieDetailLoadingEvent>(_onLoadingCastApi);
    loadCastOnInit();
  }

  FutureOr<void> _onInitEvent(MovieDetailInitEvent event, Emitter<MovieDetailState> emit) {
    emit(MovieDetailReadMoreState(isReadMore: _isReadMore, cast: _cast));
  }

  FutureOr<void> _onChangedReadMoreEvent(MovieDetailChangeReadMoreEvent event, Emitter<MovieDetailState> emit) {
    _isReadMore = !_isReadMore;
    emit(MovieDetailReadMoreState(isReadMore: _isReadMore, cast: _cast));
  }
  Future<void> loadCastOnInit() async {
    emit(MovieDetailLoadingState(cast: _cast));
    final check = await client.getCast(movie.id??12345);
    print(movie.id);
    print('${check.cast![0].id.toString()}');
    print('${check.cast![0].known_for_department.toString()}');
    print('${check.cast![0].character.toString()}');
    if (check.cast != null) {
      _cast = check.cast ?? [];
      emit(MovieDetailReadMoreState(isReadMore: _isReadMore,cast: _cast));
    }
  }


  Future<void> _onLoadingCastApi(
   MovieDetailLoadingEvent event, Emitter<MovieDetailState> emit) async {
    loadCastOnInit();
  }
}