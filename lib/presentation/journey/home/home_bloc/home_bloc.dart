import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/database/local/database.dart';
import 'package:movie_app/database/mapper/movie_mapper/mapper_movies.dart';
import 'package:movie_app/database/model/model/movie_model.dart';
import 'package:movie_app/database/model/movie.dart';
import 'package:movie_app/database/network/client.dart';
import 'package:movie_app/locator.dart';
import 'package:movie_app/presentation/journey/home/home_bloc/home_event.dart';
import 'package:movie_app/presentation/journey/home/home_bloc/home_state.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  bool _isClick = false;
  List<MovieModel> _listMovieModel = [];
  List<MovieJson> _listMovieJson = [];

  int _page = 0;

  final client = locator.get<RestClient>();
  final dbHandler = locator.get<DatabaseHandler>();

  HomeBloc() : super(HomeInitState()) {
    dbHandler.initDB();
    loadMovies();
    on<HomeInitEvent>(_onInitEvent);
    on<HomeOnClickEvent>(_onClickEvent);
    on<HomeGetAPIEvent>(_getAPIEvent);
    on<HomeLoadingAPIEvent>(_onLoadingAPIApi);
    on<HomeErrorAPIEvent>(_onErrorMovieApi);
    on<HomeDoneAPIEvent>(_onDoneMovieApi);
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

  Future<void> _getAPIEvent(
      HomeGetAPIEvent event, Emitter<HomeState> emit) async {
    emit(HomeGetAPIState(listMovie: _listMovieModel));
  }

  Future<void> _onLoadingAPIApi(
      HomeLoadingAPIEvent event, Emitter<HomeState> emit) async {
    emit(HomeGetAPIState(listMovie: _listMovieModel));
  }

  Future<void> _onErrorMovieApi(
      HomeErrorAPIEvent event, Emitter<HomeState> emit) async {
    emit(HomeErrorMovieApiState(listMovie: _listMovieModel));
  }

  Future<void> _onDoneMovieApi(
      HomeDoneAPIEvent event, Emitter<HomeState> emit) async {
    emit(HomeDoneMovieState(listMovie: _listMovieModel, page: event.page));
  }

  Future<void> _onSliderPageChange(
      HomeSliderChangeEvent event, Emitter<HomeState> emit) async {
    emit(HomeSliderChangeState(page: _page, listMovie: _listMovieModel));
  }

  Future<void> loadMovies() async {
    emit(HomeLoadingAPIState());
    await loadFromDB();

    emitMovies();
    await loadFromAPI();
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
    final listDBMovie = await dbHandler.movies();
    for (final movie in listDBMovie) {
      _listMovieModel.add(movieDBtoMovieModel(movie));
    }
  }

  Future<void> loadFromAPI() async {
    final check = await client.getMovie();
    if (check.results != null) {
      _listMovieJson = check.results ?? [];
      final movieJsonToModel = MovieJsonToMovieModel();
      final movieModelToEntity = MovieModelToMovieEntity();
      _listMovieModel.clear();
      for (final movie in _listMovieJson) {
        final movieModel = movieJsonToModel(movie);
        _listMovieModel.add(movieModel);
        dbHandler.insertMovie(movieModelToEntity(movieModel));
      }
    }
  }
}
