import 'package:json_annotation/json_annotation.dart';

part 'v_profile.g.dart';

@JsonSerializable()
class VProfile {

  String? number;
  String? classType;
  String? maker;
  String? model;
  String? fuelType;
  String? transmissionType;

  VProfile();

  factory VProfile.fromJson(Map<String, dynamic> json) =>
      _$VProfileFromJson(json);

  Map<String, dynamic> toJson() => _$VProfileToJson(this);

  @override
  String toString() {
    return 'VProfile{number: $number, classType: $classType, maker: $maker, model: $model, fuelType: $fuelType, transmissionType: $transmissionType}';
  }
}
