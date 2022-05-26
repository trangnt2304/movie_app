import 'package:json_annotation/json_annotation.dart';

part 'respondata.g.dart';
@JsonSerializable(genericArgumentFactories: true)
class ResponseData<T>{
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  T? results;
  ResponseData({this.page,this.results});
  factory ResponseData.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ResponseDataFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ResponseDataToJson(this, toJsonT);
}
