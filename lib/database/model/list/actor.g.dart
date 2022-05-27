// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cast _$CastFromJson(Map<String, dynamic> json) => Cast(
      adult: json['adult'] as bool?,
      gender: json['gender'] as int?,
      id: json['id'] as int?,
      known_for_department: json['known_for_department'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      cast_id: json['cast_id'] as int?,
      character: json['character'] as String?,
      credit_id: json['credit_id'] as String?,
      name: json['name'] as String?,
      order: json['order'] as int?,
      original_name: json['original_name'] as String?,
      profile_path: json['profile_path'] as String?,
    );

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.known_for_department,
      'name': instance.name,
      'original_name': instance.original_name,
      'popularity': instance.popularity,
      'profile_path': instance.profile_path,
      'cast_id': instance.cast_id,
      'character': instance.character,
      'credit_id': instance.credit_id,
      'order': instance.order,
    };
