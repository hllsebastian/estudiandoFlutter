import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MoviesProvider extends ChangeNotifier {

  String _apikey   = '55544097f5114f21b47c08544041024e';
  String _baseUrl  = 'api.themoviedb.org';
  String _language = 'es-ES';

  MoviesProvider() {
    print('MoviesProvider inicializado');

    this.getOnDisplayMovies();
  }


  getOnDisplayMovies() async {

      var url = Uri.https(_baseUrl, '3/movie/now_playing', {
        'api_key' : _apikey,
        'language': _language,
        'page'     : '1' 
      });

  // Await the http get response, then decode the json-formatted response.
  final response = await http.get(url);
  final Map<String, dynamic> decodeData = json.decode(response.body);
    print(decodeData['dates']);

  }


}







