import 'package:json_annotation/json_annotation.dart';
import 'package:turbo_care/domain/v_profile.dart';
part 'v_profiles_data.g.dart';

@JsonSerializable(explicitToJson: true)
class VProfilesData{

 final List<VProfile> vProfileList;

  VProfilesData({required this.vProfileList});

 factory VProfilesData.fromJson(Map<String, dynamic> json) =>
     _$VProfilesDataFromJson(json);

 Map<String, dynamic> toJson() => _$VProfilesDataToJson(this);

 VProfilesData copyWith({
    final List<VProfile>? vProfileList,
  }) {
    return VProfilesData(
      vProfileList: vProfileList ?? this.vProfileList,
    );
  }
}