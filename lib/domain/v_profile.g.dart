// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VProfile _$VProfileFromJson(Map<String, dynamic> json) {
  return VProfile()
    ..number = json['number'] as String?
    ..classType = json['classType'] as String?
    ..maker = json['maker'] as String?
    ..model = json['model'] as String?
    ..fuelType = json['fuelType'] as String?
    ..transmissionType = json['transmissionType'] as String?;
}

Map<String, dynamic> _$VProfileToJson(VProfile instance) => <String, dynamic>{
      'number': instance.number,
      'classType': instance.classType,
      'maker': instance.maker,
      'model': instance.model,
      'fuelType': instance.fuelType,
      'transmissionType': instance.transmissionType,
    };
