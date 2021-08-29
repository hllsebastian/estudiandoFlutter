import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;



                    // ACA definimos las peticiones HTTP

// Partes de la URL del endpoint, para centralizarlos
final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY   = '431a2b39236d43baaafbf67530faa12d';

class NewsService with ChangeNotifier {

  // Aca se contienen las noticias que obtenidas de la API
  List<Article> headlines = [];
  // En postman se adicionaron las opciones de categoria de la
  // API para obtener la piesa de URL de categoria 
  String _selectedCategory = 'business';

  bool _isLoading = true;

  // Aca se continene las noticias clasificadas por categoria.
  // Los iconos se obtuvieron del paquete "font_awesome_flutter/
  // font_awesome_flutter.dart".
  // El nombre de la categoria de la API 
  List<Category> categories = [
    Category( FontAwesomeIcons.building, 'business'  ),
    Category( FontAwesomeIcons.tv, 'entertainment'  ),
    Category( FontAwesomeIcons.addressCard, 'general'  ),
    Category( FontAwesomeIcons.headSideVirus, 'health'  ),
    Category( FontAwesomeIcons.vials, 'science'  ),
    Category( FontAwesomeIcons.volleyballBall, 'sports'  ),
    Category( FontAwesomeIcons.memory, 'technology'  ),
  ];

  Map<String, List<Article>> categoryArticles = {};


  NewsService() {
    this.getTopHeadlines();

    // Se hace un barrido de la lista de "categories"
    categories.forEach( (item) {
      this.categoryArticles[item.name] = [];
    });

    this.getArticlesByCategory( this._selectedCategory );
  }


  bool get isLoading => this._isLoading;

  // Se define el get para usar "_selectedCategory"
  get selectedCategory => this._selectedCategory;
  set selectedCategory( String valor ) {
    this._selectedCategory = valor;

    this._isLoading = true;
  // Cuando se cambia la categoria y se ejecuta "getArticlesByCategory", se
  // almacena en el mapa "categoryArticles"

    this.getArticlesByCategory( valor );
    notifyListeners();
  }

  // Aca indicamos mostrar la categoria seleccionada
  List<Article> get getArticulosCategoriaSeleccionada => this.categoryArticles[ this.selectedCategory ];



  getTopHeadlines() async {
    

      final url ='$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=ca';
      final resp = await http.get(url);

      final newsResponse = newsResponseFromJson( resp.body );

      this.headlines.addAll( newsResponse.articles );
      notifyListeners();
  }


  // Acá se lee la informacion de la categoria , se llama cuando se cambia la
  // categoria seleccionada 
  getArticlesByCategory( String category ) async {

      if ( this.categoryArticles[category].length > 0 ) {
        this._isLoading = false;
        notifyListeners();
        return this.categoryArticles[category];
      }

      // El endpoint, separamos su estructura en dos variables "$_URL_NEWS"
      // "$_APIKEY", porque su URL era muy largo y poderlos centralizar
      final url ='$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=ca&category=$category';
      
      // Aca hacemos la peticion HTTP
      final resp = await http.get(url);

      // Luego convertimos la peticion de Json a String
      final newsResponse = newsResponseFromJson( resp.body );

      // Aca añadimos toda informacion de la peticion, para esta caso los "articles"
      //
      this.categoryArticles[category].addAll( newsResponse.articles );

      this._isLoading = false;
      notifyListeners();  // Notificamos a los widgets escuchantes

  }


}




