import 'package:flutter/material.dart';
import 'package:movies_flutter_app/controller/genre_controller.dart';
import 'package:movies_flutter_app/controller/movie_controller.dart';
import 'package:movies_flutter_app/model/movie_resume.dart';
import 'package:movies_flutter_app/utils/api_response.dart';
import 'package:movies_flutter_app/utils/nav.dart';
import 'package:movies_flutter_app/views/movie.detail.dart';
import 'package:movies_flutter_app/widgets/app_loading.dart';
import 'package:movies_flutter_app/widgets/card_movie.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GenreController genreController = new GenreController();
  MovieController movieController = new MovieController();
  final ScrollController _controller = new ScrollController();
  ApiResponse _apiResponse;
  List<MovieResume> _moviesResume = List();
  bool _isLoading = false;
  int page = 1;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        page = page + 1;
        _fetchMore();
      }
    });
    _fetchData();
    _handleLoading();
  }

  _fetchMore() async {
    print("PAGE $page");
    _apiResponse = await movieController.fetchMoviesPlayingNow(page: page);
    if (_apiResponse.ok) {
      _moviesResume.clear();
      setState(() {
        _moviesResume.addAll(movieController.getMoviesResume);
      });
    }
  }

  _fetchData() async {
    genreController.fetchGender();
    _apiResponse = await movieController.fetchMoviesPlayingNow(page: page);
    if (_apiResponse.ok) {
      setState(() {
        _moviesResume.addAll(movieController.getMoviesResume);
        _handleLoading();
      });
    } else {
      _handleLoading();
    }
  }

  _handleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: Text(
          'The Movies App',
        ),
      ),
      body: _handleBody(),
    );
  }

  _handleBody() {
    if (_isLoading) {
      return AppLoading.show();
    } else if (_moviesResume.length > 0) {
      return _buildBody();
    } else {
      return Center(
        child: Text(_apiResponse.msg),
      );
    }
  }

  _buildBody() {
    return ListView.builder(
      itemCount: _moviesResume.length,
      controller: _controller,
      itemBuilder: (BuildContext context, int index) {
        MovieResume movieResume = _moviesResume.elementAt(index);
        return CardMovie(
          movieResume,
          () => _onClickMovie(movieResume),
        );
      },
    );
  }

  _onClickMovie(MovieResume movieResume) {
    Nav.push(context, MovieDetail(movieResume));
  }
}
