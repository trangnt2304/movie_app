import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/database/model/movie/cast.dart';

part 'respon_cast_data.g.dart';
@JsonSerializable(genericArgumentFactories: true)
class ResponseCastData{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'cast')
  List<Cast>? cast;

  ResponseCastData({this.id, this.cast});

  factory ResponseCastData.fromJson(Map<String, dynamic> json) => _$ResponseCastDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseCastDataToJson(this);
}
