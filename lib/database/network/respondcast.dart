import 'package:json_annotation/json_annotation.dart';

part 'respondcast.g.dart';
@JsonSerializable(genericArgumentFactories: true)
class ResponseCast<T>{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'cast')
  T? cast;
  ResponseCast({this.id,this.cast});
  factory ResponseCast.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ResponseCastFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ResponseCastToJson(this, toJsonT);
}
