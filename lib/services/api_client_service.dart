import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:turbo_care/domain/api_response.dart';

class ApiClientService {
  static const String BASE_URL = 'https://test.turbocare.app/turbo/care/v1';

  static final ApiClientService _instance = ApiClientService._internal();

  ApiClientService._internal();

  factory ApiClientService() => _instance;

  Future<ApiResponse<List<String>?>> getMakersList(String classType) async {
    var url = BASE_URL + '/makes?class=$classType';

    ApiResponse<List<String>?> apiResponse;

    try {
      http.Response res = await http
          .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});

      if (res.statusCode != 200) {
        apiResponse = ApiResponse(false, null, "${res.statusCode} ${res.body}");
      } else {
        var l = jsonDecode(res.body) as List<dynamic>;
        var dataList = l.cast<String>();

        apiResponse =
            ApiResponse(true, dataList, "${res.statusCode} ${res.body}");
      }
    } catch (error) {
      apiResponse = ApiResponse(false, null, "$error");
    }

    return Future.value(apiResponse);
  }

  Future<ApiResponse<List<String>?>> getModelsList(
      String classType, String maker) async {
    var url = BASE_URL + '/models?class=$classType&make=$maker';

    ApiResponse<List<String>?> apiResponse;

    try {
      http.Response res = await http
          .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});

      if (res.statusCode != 200) {
        apiResponse = ApiResponse(false, null, "${res.statusCode} ${res.body}");
      } else {
        var l = jsonDecode(res.body) as List<dynamic>;
        var dataList = l.cast<String>();

        apiResponse =
            ApiResponse(true, dataList, "${res.statusCode} ${res.body}");
      }
    } catch (error) {
      apiResponse = ApiResponse(false, null, "$error");
    }

    return Future.value(apiResponse);
  }
}
