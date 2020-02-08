import 'package:flutter/material.dart';
import 'package:movies_flutter_app/config/config.dart';
import 'package:movies_flutter_app/controller/genre_controller.dart';
import 'package:movies_flutter_app/model/genres.dart';
import 'package:movies_flutter_app/model/movie_resume.dart';
import 'package:movies_flutter_app/utils/utils.dart';

class MovieDetail extends StatelessWidget {
  final MovieResume movie;
  final GenreController genreController = new GenreController();
  MovieDetail(this.movie);
  @override
  Widget build(BuildContext context) {
    List<Genres> _genres = genreController.findInList(movie.genreIds);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            flexibleSpace: Image.network(
              Config.base_url_img + movie.posterPath,
              fit: BoxFit.cover,
            ),
            expandedHeight: 500,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    movie.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    Utils.handleGenre(_genres),
                  ),
                  Text(
                    Utils.handleDate(movie.releaseDate),
                  ),
                  Divider(),
                  Text(movie.overview)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
