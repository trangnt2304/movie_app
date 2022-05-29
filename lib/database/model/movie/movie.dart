import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey()
  String? poster_path;
  @JsonKey()
  bool? adult;
  @JsonKey()
  String? overview;
  @JsonKey()
  String? backdrop_path;
  @JsonKey()
  String? release_date;
  @JsonKey()
  List<int>? genre_ids;
  @JsonKey()
  int? id;
  @JsonKey()
  String? original_title;
  @JsonKey()
  String? original_language;
  @JsonKey()
  double? popularity;
  @JsonKey()
  String? title;
  @JsonKey()
  bool? video;
  @JsonKey()
  double? vote_average;
  @JsonKey()
  int? vote_count;
  Movie(
      {this.adult,
      this.backdrop_path,
      this.genre_ids,
      this.id,
      this.original_language,
      this.original_title,
      this.overview,
      this.popularity,
      this.poster_path,
      this.release_date,
      this.title,
      this.video,
      this.vote_average,
      this.vote_count});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
