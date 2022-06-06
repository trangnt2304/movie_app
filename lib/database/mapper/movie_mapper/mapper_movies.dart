import 'package:movie_app/database/local/entity/movie_entity.dart';
import 'package:movie_app/database/mapper/mapper.dart';
import 'package:movie_app/database/model/model/movie_model.dart';
import 'package:movie_app/database/model/movie.dart';

class MovieModelToMovieEntityMapper implements Mapper<MovieModel, MovieEntity> {
  @override
  MovieEntity call(MovieModel object) {
    return MovieEntity(
        id: object.id,
        posterPath: object.posterPath,
        overview: object.overview,
        backdropPath: object.backdropPath,
        originalTitle: object.originalTitle,
        popularity: object.popularity,
        title: object.title,
        voteAverage: object.voteAverage,
        voteCount: object.voteCount);
  }
}

class MovieEntityToMovieModelMapper implements Mapper<MovieEntity, MovieModel> {
  @override
  MovieModel call(MovieEntity object) {
    return MovieModel(
        id: object.id,
        posterPath: object.posterPath,
        overview: object.overview,
        backdropPath: object.backdropPath,
        originalTitle: object.originalTitle,
        popularity: object.popularity,
        title: object.title,
        voteAverage: object.voteAverage,
        voteCount: object.voteCount);
  }
}

class MovieJsonToMovieModelMapper implements Mapper<MovieJson, MovieModel> {
  @override
  MovieModel call(MovieJson object) {
    return MovieModel(
        id: object.id ?? 0,
        posterPath: object.posterPath ?? '',
        overview: object.overview ?? '',
        backdropPath: object.backdropPath ?? '',
        originalTitle: object.originalTitle ?? '',
        popularity: object.popularity ?? 0,
        title: object.title ?? '',
        voteAverage: object.voteAverage ?? 0,
        voteCount: object.voteCount ?? 0);
  }
}

class MovieModelToMovieJsonMapper implements Mapper<MovieModel, MovieJson> {
  @override
  MovieJson call(MovieModel object) {
    return MovieJson(
        id: object.id,
        posterPath: object.posterPath,
        overview: object.overview,
        backdropPath: object.backdropPath,
        originalTitle: object.originalTitle,
        popularity: object.popularity,
        title: object.title,
        voteAverage: object.voteAverage,
        voteCount: object.voteCount);
  }
}

