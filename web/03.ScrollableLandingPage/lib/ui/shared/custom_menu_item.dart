import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';


// Se define como Stateful para el redibujo cuando el cursor esta sobre
// el mnenu. Aca se define la lista de opciones del menu 
class CustomMenuItem extends StatefulWidget {

  final String text;
  final Function onPressed;
  final int delay;  // Parametro para darle un tiempo de entrada a la opcion
                    // cuando se abre el menu de opciones 

  const CustomMenuItem({
    Key? key,
    required this.text,
    required this.onPressed, 
    this.delay = 0
  }) : super(key: key);

  @override
  _CustomMenuItemState createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft( // Para configurar una animacion en el menu de opciones
      from: 10,
      duration: Duration(milliseconds: 150),
      delay: Duration( milliseconds: widget.delay ), // Para establecer un tiempo de carga a la opcion del menu
      child: MouseRegion(  // Se definio la animacion cuando el cursor esta sobre una opcion
        onEnter: ( _ ) => setState(() => isHover = true ), // Cuando el mouese esta encima
        onExit: ( _ ) => setState(() => isHover = false ), // Cuando el mouese no esta encima
        child: GestureDetector(
          onTap: () => widget.onPressed(),
          child: AnimatedContainer(
            duration: Duration( milliseconds: 300 ),
            width: 150,
            height: 50,
            color: isHover ? Colors.pinkAccent : Colors.transparent,
            child: Center(
              child: Text(
                widget.text,
                style: GoogleFonts.roboto( fontSize: 20, color: Colors.white )
              ),
            ),
          ),
        ),
      ),
    );
  }
}