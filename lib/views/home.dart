import 'package:flutter/material.dart';
import 'package:movies_flutter_app/service/movies_service.dart';
import 'package:movies_flutter_app/widgets/app_loading.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          MoviesService.fetchGenre();
        },
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
                      'https://image.tmdb.org/t/p/w500/gy3L9Ki5539VjcKN1cRXo9lBKNu.jpg',
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
                      Text('Titulo'),
                      Row(
                        children: <Widget>[
                          Text('Ano'),
                          Text('generos'),
                        ],
                      ),
                      Text('Adulto'),
                      Flexible(
                        child: Text(
                          'No auge da Primeira Guerra Mundial, dois jovens soldados britânicos, Schofield e Blake, recebem uma missão aparentemente impossível. Numa corrida contra o tempo, têm de atravessar território inimigo e entregar uma mensagem que impedirá um ataque letal contra centenas de soldados, entre eles o irmão de Blake.',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
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
}
