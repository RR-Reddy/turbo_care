// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v_profiles_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VProfilesData _$VProfilesDataFromJson(Map<String, dynamic> json) {
  return VProfilesData(
    vProfileList: (json['vProfileList'] as List<dynamic>)
        .map((e) => VProfile.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$VProfilesDataToJson(VProfilesData instance) =>
    <String, dynamic>{
      'vProfileList': instance.vProfileList.map((e) => e.toJson()).toList(),
    };
