import 'package:movie_app/database/local/entity/movie_entity.dart';
import 'package:movie_app/database/mapper/mapper.dart';
import 'package:movie_app/database/model/model/movie_model.dart';
import 'package:movie_app/database/model/movie.dart';

class MovieModelToMovieEntity implements Mapper<MovieModel, MovieEntity> {
  @override
  MovieEntity call(MovieModel object) {
    return MovieEntity(
        id: object.id,
        poster_path: object.poster_path,
        overview: object.overview,
        backdrop_path: object.backdrop_path,
        original_title: object.original_title,
        popularity: object.popularity,
        title: object.title,
        vote_average: object.vote_average,
        vote_count: object.vote_count);
  }
}

class MovieEntityToMovieModel implements Mapper<MovieEntity, MovieModel> {
  @override
  MovieModel call(MovieEntity object) {
    return MovieModel(
        id: object.id,
        poster_path: object.poster_path,
        overview: object.overview,
        backdrop_path: object.backdrop_path,
        original_title: object.original_title,
        popularity: object.popularity,
        title: object.title,
        vote_average: object.vote_average,
        vote_count: object.vote_count);
  }
}

class MovieJsonToMovieModel implements Mapper<MovieJson, MovieModel> {
  @override
  MovieModel call(MovieJson object) {
    return MovieModel(
        id: object.id??0,
        poster_path: object.poster_path??'',
        overview: object.overview??'',
        backdrop_path: object.backdrop_path??'',
        original_title: object.original_title??'',
        popularity: object.popularity??0,
        title: object.title??'',
        vote_average: object.vote_average??0,
        vote_count: object.vote_count??0);
  }
}

class MovieModelToMovieJson implements Mapper<MovieModel, MovieJson> {
  @override
  MovieJson call(MovieModel object) {
    return MovieJson(
        id: object.id,
        poster_path: object.poster_path,
        overview: object.overview,
        backdrop_path: object.backdrop_path,
        original_title: object.original_title,
        popularity: object.popularity,
        title: object.title,
        vote_average: object.vote_average,
        vote_count: object.vote_count);
  }
}