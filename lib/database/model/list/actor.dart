import 'package:json_annotation/json_annotation.dart';

part 'actor.g.dart';

@JsonSerializable()
class Cast {
  bool? adult;
  int? gender;
  int? id;
  String? known_for_department;
  String? name;
  String? original_name;
  double? popularity;
  String? profile_path;
  int? cast_id;
  String? character;
  String? credit_id;
  int? order;

  Cast({
      this.adult,
      this.gender,
      this.id,
      this.known_for_department,
      this.popularity,
      this.cast_id,
      this.character,
      this.credit_id,
      this.name,
      this.order,
      this.original_name,
      this.profile_path});

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
  Map<String, dynamic> toJson() => _$CastToJson(this);
}
