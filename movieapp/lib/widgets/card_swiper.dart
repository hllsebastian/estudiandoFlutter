import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';


class CardSwiper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Variable para calcular el tamaño del container en la pantalla, usando
    // la clas "MediaQuery"
    final size = MediaQuery.of(context).size; 
    
    return Container(
      width: double.infinity, // Para que se anche lo maximo posible en la pantalla
      height: size.height * 0.5,
      child: Swiper( // Widget que usa paquete externo
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,      
        itemHeight: size.height * 0.4 ,
        itemBuilder: ( _, index){ // "_" se refiere al context
          
          return GestureDetector( //Al dart tap en un recuadro cargar nueva page
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image      : NetworkImage('http://via.placeholder.com/300x400'), 
              fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}