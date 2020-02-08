import 'package:movies_flutter_app/model/genres.dart';

class Utils {
  static handleGenre(List<Genres> genres) {
    String text = '';
    for (int i = 0; i < genres.length; i++) {
      if ((i + 1 == genres.length)) {
        text += genres.elementAt(i).name + '.';
      } else {
        text += genres.elementAt(i).name + ', ';
      }
    }

    return text;
  }

  static handleDate(String releaseDate) {
    return '${releaseDate.split("-")[2]}/${releaseDate.split("-")[1]}/${releaseDate.split("-")[0]}';
  }
}
