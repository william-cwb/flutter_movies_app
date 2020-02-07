import 'package:movies_flutter_app/model/genres.dart';
import 'package:movies_flutter_app/service/genre_service.dart';
import 'package:movies_flutter_app/utils/api_response.dart';

class GenreController {
  static final GenreController _instance = GenreController.internal();
  factory GenreController() => _instance;
  GenreController.internal();

  List<Genre> _genreList = List();
  List<Genre> get getGenres => _genreList;

  void fetchGender() async {
    final ApiResponse response = await GenreService.fetchGenre();
    if (response.ok) {
      _genreList = response.data['genres']
          .map<Genre>((json) => Genre.fromJson(json))
          .toList();
    }
  }

  findInList(List<int> ids) {
    List<Genre> genres = List();
    ids.map((id) {
      _genreList.map((data) {
        if (data.id == id) {
          genres.add(data);
        }
      }).toList();
    }).toList();
    return genres;
  }
}
