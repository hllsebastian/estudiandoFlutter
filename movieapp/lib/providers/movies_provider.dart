import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apikey   = '55544097f5114f21b47c08544041024e';
  String _baseUrl  = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies   = [];

  Map<int, List<Cast>> movieCast = {};

  int _popularPage = 0;

  MoviesProvider() {
    print('MoviesProvider inicializado');

    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint, {
      'api_key' : _apikey, 
      'language': _language, 
      'page'    : '$page' 
    });
        // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }
   


  getOnDisplayMovies() async {
   
    final jsonData = await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    // Se guarda en una lista el Json
    onDisplayMovies = nowPlayingResponse.results;

    //va a redibujar los widgets relacionados a la informacion que cambio
    notifyListeners();
  }

  getPopularMovies() async {

    _popularPage++;

    final jsonData = await this._getJsonData('3/movie/popular', _popularPage);

    // Await the http get response, then decode the json-formatted response.
    final popularResponse = PopularResponse.fromJson(jsonData); 

    // se usaron los puntos suspensivos y los corchetes para
    // desestructurar porque al pasar a una nueva pagina se quiere
    // mantener las peliculas de la anterior pagina
    popularMovies = [...popularMovies, ...popularResponse.results];

    //va a redibujar los widgets relacionados a la informacion que cambio
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async{

    //TODO: revisar el mapa

    print('pidiendo info al servidor - cast');

    final jsonData = await this._getJsonData('3/movie/$movieId/credits', _popularPage);
    final creditResponse = CreditsResponse.fromJson(jsonData);

    movieCast[movieId] = creditResponse.cast; 
    return creditResponse.cast;


    
  }

}
