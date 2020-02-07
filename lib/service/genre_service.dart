import 'package:movies_flutter_app/constant/app_const.dart';
import 'package:movies_flutter_app/utils/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GenreService {
  static Future<ApiResponse> fetchGenre() async {
    try {
      final response = await http.get(
          '${AppConst.base_url_movie}genre/movie/list?${AppConst.api_key}');
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        return ApiResponse.onSuccess(data);
      } else {
        return ApiResponse.onError(data["status_message"]);
      }
    } catch (err) {
      return ApiResponse.onError(ApiResponse.connError);
    }
  }
}
