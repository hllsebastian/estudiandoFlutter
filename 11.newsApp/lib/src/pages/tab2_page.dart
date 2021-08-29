import 'package:flutter/material.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/theme/tema.dart';
import 'package:newsapp/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';


class Tab2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Para mostrar la categoria seleccionada 
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            
            _ListaCategorias(),

            if ( !newsService.isLoading )
              Expanded( //"Expanded", Para que ocupe el espacio posible 
                child: ListaNoticias( newsService.getArticulosCategoriaSeleccionada )
              ),

            if ( newsService.isLoading )
            Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              )
            )
          ],
        )
   ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: BouncingScrollPhysics(), // Para que se mire igual en IOS y Android
        scrollDirection: Axis.horizontal, // Para hacer scroll horizontal
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {

          // Asigno esta variable para capitalizar la primera letra
          final cName = categories[index].name;

        return Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              _CategoryButton( categories[index] ),
              SizedBox( height: 5),
              // Acá se capitalizao la primera letra
              Text( '${ cName[0].toUpperCase() }${ cName.substring(1) }' )
            ],
          ),
        );
       },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  
  final Category categoria;

  const _CategoryButton( this.categoria );

  @override
  Widget build(BuildContext context) {

    // Se ubica el Provider aca para que se pueda redibujar el icono cuando
    // se selecciona la categoria 
    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: (){
        // print('${ categoria.name }');

        // Cuando se esta en un evento tap o click, el elemento no tiene que
        // redibujarse, por eso el  "listen: false"
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric( horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          categoria.icon,
          // Condicion para cambiar el color cuando el icono esta seleccionado
          color: (newsService.selectedCategory == this.categoria.name  )
                ? miTema.accentColor
                : Colors.black54,
        ),
      ),
    );
  }
}