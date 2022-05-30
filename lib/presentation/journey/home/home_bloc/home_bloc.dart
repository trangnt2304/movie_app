import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/database/local/database.dart';
import 'package:movie_app/database/mapper/movie_mapper/mapper_movies.dart';
import 'package:movie_app/database/model/model/movie_model.dart';
import 'package:movie_app/database/model/movie.dart';
import 'package:movie_app/database/network/client.dart';
import 'package:movie_app/presentation/journey/home/home_bloc/home_event.dart';
import 'package:movie_app/presentation/journey/home/home_bloc/home_state.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  bool _isClick = false;
  List<MovieModel> _listMovieModel = [];
  List<MovieJson> _listMovieJson = [];

  int _page = 0;
  final client = RestClient(Dio(BaseOptions(contentType: "application/json")));
  DatabaseHandler handler = DatabaseHandler();

  HomeBloc() : super(HomeInitState()) {
    handler.initDB();
    loadMovies();
    on<HomeInitEvent>(_onInitEvent);
    on<HomeOnClickEvent>(_onClickEvent);
    on<HomeGetImgEvent>(_getImgEvent);
    on<HomeLoadingImgEvent>(_onLoadingImgApi);
    on<HomeErrorImgEvent>(_onErrorMovieApi);
    on<HomeDoneImgEvent>(_onDoneMovieApi);
    on<HomeSliderChangeEvent>(_onSliderPageChange);
//    loadMovieOnInit();
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
    emit(HomeGetImgState(listMovie: _listMovieModel));
  }

  Future<void> _onLoadingImgApi(
      HomeLoadingImgEvent event, Emitter<HomeState> emit) async {
    emit(HomeGetImgState(listMovie: _listMovieModel));
  }

  Future<void> _onErrorMovieApi(
      HomeErrorImgEvent event, Emitter<HomeState> emit) async {
    emit(HomeErrorMovieApiState(listMovie: _listMovieModel));
  }

  Future<void> _onDoneMovieApi(
      HomeDoneImgEvent event, Emitter<HomeState> emit) async {
    emit(HomeDoneMovieState(listMovie: _listMovieModel, page: event.page));
  }

  Future<void> _onSliderPageChange(
      HomeSliderChangeEvent event, Emitter<HomeState> emit) async {
    emit(HomeSliderChangeState(page: _page, listMovie: _listMovieModel));
  }

  Future<void> loadMovies() async {
    print('Bat dau load');
    emit(HomeLoadingImgState());
    print('Bat dau load tu db');
    await loadFromDB();
    print('Load xong tu db');

    emitMovies();
    // print('Load tiep API');
    await loadFromAPI();
    print('Load xong API');
    emitMovies();
  }

  void emitMovies() {
    if (_listMovieModel.isNotEmpty) {
      emit(HomeDoneMovieState(listMovie: _listMovieModel, page: _page));
    }
  }

  Future<void> loadFromDB() async {
     //Load DB
    final movieDBtoMovieModel = MovieEntityToMovieModel();
    final listDBMovie = await handler.movies();
    for(final movie in listDBMovie){
      _listMovieModel.add(movieDBtoMovieModel(movie));
    }
  }

  Future<void> loadFromAPI() async {
    print('Load API 1');
    final check = await client.getMovie();
    print('Load API 2');
    if (check.results != null) {
      print('Load API 3');
      _listMovieJson = check.results ?? [];
      final movieJsonToModel = MovieJsonToMovieModel();
      final movieModelToEntity = MovieModelToMovieEntity();
      _listMovieModel.clear();
      for(final movie in _listMovieJson){
        final movieModel = movieJsonToModel(movie);
        _listMovieModel.add(movieModel);
        handler.insertMovie(movieModelToEntity(movieModel));
      }
      print('Load API 4: ${_listMovieModel.length}');
    }
  }
}
