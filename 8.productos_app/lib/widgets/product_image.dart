import 'dart:io';

import 'package:flutter/material.dart';

// Aca se define la estructura de la pagina que se abre cuando se da tap
// en cualquier imagen

class ProductImage extends StatelessWidget {

  // Para que se muestre la imagen del producto llamada del servidor en la
  // screen "ProductScreen" 
  final String? url;

  const ProductImage({
    Key? key, 
    this.url
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only( left: 10, right: 10, top: 10 ),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 450,
        child: Opacity( // Ayuda a que los botones blancos (regresar y camara)
                  // se observen cuando la imagen tiene fondo blanco 
          opacity: 0.9,
          child: ClipRRect( // Para hacer borde redondeado a widgets internos
            borderRadius: BorderRadius.only( topLeft: Radius.circular( 45 ), topRight: Radius.circular(45) ),
            child: getImage(url)
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.only( topLeft: Radius.circular( 45 ), topRight: Radius.circular(45) ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),//".withOpacity" para definir la opacidad
        blurRadius: 10,
        offset: Offset(0,5)
      )
    ]
  );


  Widget getImage( String? picture ) {

    // condicionamiento para que muestre una imagen predifinida si el servidor
    // no envia una imagen
    if ( picture == null ) 
      return Image(
          image: AssetImage('assets/no-image.png'),
          fit: BoxFit.cover,
        );

    // Condicion para cargar la imagen con URL  
    if ( picture.startsWith('http') ) 
        return FadeInImage(
          image: NetworkImage( this.url! ),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fit: BoxFit.cover,
        );

    // Si no cumple las anteriories, se almacena la imagen tomada con la camara
    return Image.file(
      File( picture ),
      fit: BoxFit.cover,
    );
  }

}