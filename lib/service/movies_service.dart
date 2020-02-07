import 'package:movies_flutter_app/constant/app_const.dart';
import 'package:movies_flutter_app/utils/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MoviesService {
  static Future<ApiResponse> fetchMoviesNowPlaying() async {
    try {
      final response = await http.get(
          '${AppConst.base_url_movie}movie/now_playing?${AppConst.api_key}');
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        print("teste");
        return ApiResponse.onSuccess(data);
      } else {
        print("teste 1");
        return ApiResponse.onError(data["status_message"]);
      }
    } catch (err) {
      print("teste 2");
      return ApiResponse.onError(ApiResponse.connError);
    }
  }
}
