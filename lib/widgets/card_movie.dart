import 'package:flutter/material.dart';
import 'package:movies_flutter_app/constant/app_const.dart';
import 'package:movies_flutter_app/controller/genre_controller.dart';
import 'package:movies_flutter_app/model/genres.dart';
import 'package:movies_flutter_app/model/movie_resume.dart';

class CardMovie extends StatelessWidget {
  final MovieResume movieResume;
  final Function onClick;
  GenreController controller = new GenreController();
  CardMovie(this.movieResume, this.onClick);

  @override
  Widget build(BuildContext context) {
    List<Genre> _genres = controller.findInList(movieResume.genreIds);

    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: onClick,
        child: Container(
          width: double.maxFinite,
          height: 150,
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      AppConst.base_url_img + movieResume.posterPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        movieResume.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        _handleDate(movieResume.releaseDate),
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(_handleGenre(_genres)),
                      movieResume.adult
                          ? Text('Conteúdo adulto')
                          : SizedBox(height: 2),
                      Text(
                        'Nota: ${movieResume.voteAverage.toString()}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _handleGenre(List<Genre> genres) {
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

  _handleDate(String releaseDate) {
    return '${releaseDate.split("-")[2]}/${releaseDate.split("-")[1]}/${releaseDate.split("-")[0]}';
  }
}
