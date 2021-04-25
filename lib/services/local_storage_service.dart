import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbo_care/domain/v_profiles_data.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();

  LocalStorageService._internal();

  factory LocalStorageService() => _instance;

  static const String _KEY_SharedPrefData = 'k_spd';

  Future<VProfilesData> getSharedPrefData() async {
    Future<VProfilesData> res;

    var prefs = await SharedPreferences.getInstance();
    var val = prefs.getString(_KEY_SharedPrefData);
    if (val == null) {
      // set defaults
      var data = VProfilesData(vProfileList: []);
      res = Future.value(data);
    } else {
      res = Future.value(VProfilesData.fromJson(jsonDecode(val)));
    }

    return res;
  }

  void saveSharedPrefData(VProfilesData data) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(_KEY_SharedPrefData, jsonEncode(data.toJson()));
  }
}
