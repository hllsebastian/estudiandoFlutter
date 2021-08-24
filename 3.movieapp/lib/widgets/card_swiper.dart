import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:movieapp/models/models.dart';


class CardSwiper extends StatelessWidget {

  final List<Movie> movies;

  const CardSwiper({
    Key? key, 
    required this.movies
    }) : super(key: key);

  



  @override
  Widget build(BuildContext context) {

    // Variable para calcular el tamaño del container en la pantalla, usando
    // la clas "MediaQuery"
    final size = MediaQuery.of(context).size; 

    //como el widget Swiper defecto muestra una ventana de error si no tiene
    //imagenes para mostrar mientras carga, entonces se uso este algoritmo 
    //para mostrar el icono "CircularProgressIndicator()" mientras carga
    if(this.movies.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center(
          child: CircularProgressIndicator()
        ),
      );
    }



    
    return Container(
      width : double.infinity, // Para que se anche lo maximo posible en la pantalla
      height: size.height * 0.5,
      child : Swiper( // Widget que usa paquete externo para deslizar ventanas de 
                  // forma horizontal
        itemCount  : movies.length,
        layout     : SwiperLayout.STACK,
        itemWidth  : size.width * 0.6,      
        itemHeight : size.height * 0.4 ,
        itemBuilder: ( _, index){ // "_" se refiere al context

          final movie = movies[index];
          
          return GestureDetector( //Al dart tap en un recuadro cargar nueva page
            onTap : () => Navigator.pushNamed( _, 'details', arguments: 'movie-instance'),
            child : ClipRRect( // Widget para recortar los bordes puntiaguado
              borderRadius: BorderRadius.circular(30),
              child       : FadeInImage(//para mostrar una imagen mientras carga el contenido
              placeholder : AssetImage('assets/no-image.jpg'),
              image       : NetworkImage(movie.fullPosterImg), 
              fit         : BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}