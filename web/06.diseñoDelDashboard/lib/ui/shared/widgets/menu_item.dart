import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatefulWidget {

  final String text;
  final IconData icon;
  final bool isActive; // para marcar una opcion del sidemenu que esta seleccionada
  final Function onPressed;

  const MenuItem({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.isActive = false,
  }) : super(key: key);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {

  bool isHovered = false; // Para definir cuando el cursor del mouse esta sobre
                          // una opcion

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(  // Ayudara a cambiar el menu del fondo
      duration: Duration( milliseconds: 250 ),
      color: isHovered
        ? Colors.white.withOpacity(0.1)
        : widget.isActive ? Colors.white.withOpacity(0.1) : Colors.transparent,
      child: Material(  // Para hacer el splash
        color: Colors.transparent,
        child: InkWell(  

          // cuando la una opcion del menu esta activa, desactivara el onPressed,
          // de lo contrario lo activara 
          onTap: widget.isActive ? null : () => widget.onPressed(),
          child: Padding(
            padding: EdgeInsets.symmetric( horizontal: 30, vertical: 10),
            
            child: MouseRegion( // Para saber cuando el mouse entra y sale de la opcion
              onEnter: ( _ ) => setState( () => isHovered = true ), // Dentro de la opcion
              onExit: ( _ ) => setState( () => isHovered = false ), // fuera de la opcion
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon( widget.icon, color: Colors.white.withOpacity(0.3)),
                  SizedBox( width: 10 ),
                  Text(
                    widget.text,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.8)
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}