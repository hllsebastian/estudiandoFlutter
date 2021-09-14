import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// Widget creado para que funcione como boton en los links_bar

class LinkText extends StatefulWidget {

  final String text; 

  // Funcion para cuando se haga click en un enlace
  final Function? onPressed;

  const LinkText({
    Key? key, 
    required this.text, 
    this.onPressed
  }) : super(key: key);

  @override
  _LinkTextState createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {

  // Propiedad que dice cuando el mouse esta sobre la opcion o fuera
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // PAra establecer una opcion cuando se hace click
      onTap: (){
        if( widget.onPressed != null ) widget.onPressed!();
      },
      child: MouseRegion(

        cursor: SystemMouseCursors.click,// Para que cambio el icono del cursor del mouse
                                      // cuando esta sobre una opcion
        onEnter: ( _ ) => setState(()=> isHover = true ), // encima de la opcion
        onExit: ( _ ) => setState(()=> isHover = false ), // fuera de la opcion
        child: Container(
          margin: EdgeInsets.symmetric( horizontal: 10, vertical: 5 ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
              // Aca se defino si el mouse esta encima usar el "TextDecoration.underline"
              // de lo contrario nada 
              decoration: isHover ? TextDecoration.underline : TextDecoration.none
            ),
          ),
        ),
      ),
    );
  }
}