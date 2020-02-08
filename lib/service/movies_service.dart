import 'package:movies_flutter_app/config/config.dart';
import 'package:movies_flutter_app/utils/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MoviesService {
  static Future<ApiResponse> fetchMoviesNowPlaying(int page) async {
    print("pageRecebida2: $page");
    try {
      final response = await http.get(
          '${Config.base_url_movie}movie/now_playing?api_key=${Config.api_key}&language=pt-BR&page=$page');
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
