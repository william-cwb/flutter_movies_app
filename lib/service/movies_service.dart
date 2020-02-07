import 'package:movies_flutter_app/model/genres.dart';
import 'package:movies_flutter_app/utils/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MoviesService {
  static final String base_url_movie = 'https://api.themoviedb.org/3/';
  static final String base_url_img = 'https://image.tmdb.org/t/p/w500';
  static final String api_key =
      'api_key=53133282dc48b97f36b50a6a54ac8d48&language=pt-BR';

  static Future<ApiResponse> fetchMoviesNowPlaying() {}

  static void fetchGenre() async {
    try {
      final response =
          await http.get('${base_url_movie}genre/movie/list?$api_key');
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);
        // return ApiResponse.onSuccess(data);
      } else {
        // return ApiResponse.onError(data["response"]["message"]);
      }
    } catch (err) {
      print(err);
    }
  }
}
