// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'respondcast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseCast<T> _$ResponseCastFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ResponseCast<T>(
      id: json['id'] as int?,
      cast: _$nullableGenericFromJson(json['cast'], fromJsonT),
    );

Map<String, dynamic> _$ResponseCastToJson<T>(
  ResponseCast<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': _$nullableGenericToJson(instance.cast, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
