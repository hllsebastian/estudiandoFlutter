import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Dejara elegir una fuente

class HomeView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Center(
        child: FittedBox( // Ajusta el tamaño del contenido con el tamaño de la ventana
          fit: BoxFit.contain,
          child: Text(
            'Home',
                    // "GoogleFonts.", paquete que deja elegir una fuente 
            style: GoogleFonts.montserratAlternates(
              fontSize: 80,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}