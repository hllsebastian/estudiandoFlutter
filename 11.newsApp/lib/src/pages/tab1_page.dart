import 'package:flutter/material.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';


// Usamos el StatefulWidget, para mantener en memoria la ultima posicion cuando
// cambia de pagina y regresa, ademas se debe hacer esta mezcla
// "....extends State<Tab1Page> with AutomaticKeepAliveClientMixin" y enviar el
// override "bool get wantKeepAlive => true"  

class Tab1Page extends StatefulWidget {

  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {

    // LLamando la instancia del Provider
    final headlines = Provider.of<NewsService>(context).headlines;

    return Scaffold(

      // Condicion para mostrar icono de carga, si las noticias aun no se
      // han cargado 
      body: ( headlines.length == 0 )
          ? Center(child: CircularProgressIndicator() )
          : ListaNoticias( headlines )
   );
  }

  @override
  bool get wantKeepAlive => true; // Esta parte es por si quiere destruirse en
    // algun momento o con alguna condicion 
} 