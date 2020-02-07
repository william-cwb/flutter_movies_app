import 'package:movies_flutter_app/model/movie_resume.dart';
import 'package:movies_flutter_app/service/movies_service.dart';
import 'package:movies_flutter_app/utils/api_response.dart';

class MovieController {
  static final MovieController _instance = MovieController.internal();
  factory MovieController() => _instance;
  MovieController.internal();

  List<MovieResume> _movieResume = List();
  List<MovieResume> get getMoviesResume => _movieResume;
  Future<ApiResponse> fetchMoviesPlayingNow() async {
    final ApiResponse response = await MoviesService.fetchMoviesNowPlaying();
    if (response.ok) {
      _movieResume = response.data['results']
          .map<MovieResume>((json) => MovieResume.fromJson(json))
          .toList();

      return response;
    } else {
      return response;
    }
  }
}
