import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apikey = '55544097f5114f21b47c08544041024e';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies   = [];


  MoviesProvider() {
    print('MoviesProvider inicializado');

    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;

      //va a redibujar los widgets relacionados a la informacion que cambio
    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apikey, 'language': _language, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);

              // se usaron los puntos suspensivos y los corchetes para 
              // desestructurar porque al pasar a una nueva pagina se quiere
              // mantener las peliculas de la anterior pagina
    popularMovies = [...popularMovies, ...popularResponse.results];

      //va a redibujar los widgets relacionados a la informacion que cambio
    notifyListeners();
  }


}
