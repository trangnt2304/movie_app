import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class MovieJson {
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'adult')
  bool? adult;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'popularity')
  double? popularity;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'video')
  bool? video;
  @JsonKey(name: 'vote_averag')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;
  MovieJson(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  factory MovieJson.fromJson(Map<String, dynamic> json) => _$MovieJsonFromJson(json);
  Map<String, dynamic> toJson() => _$MovieJsonToJson(this);
}

