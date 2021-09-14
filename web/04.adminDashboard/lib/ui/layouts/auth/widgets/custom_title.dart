import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// Aca se creo el logo de Twiter que ira en el espacio del login

class CustomTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 20 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'twitter-white-logo.png',
            width: 50,
            height: 50,
          ),

          SizedBox( height: 20 ),

          FittedBox( // Para contraer el texto cuando la pagina disminuye el tamaño
            fit: BoxFit.contain, 
            child: Text(
              'Happening Now',
              style: GoogleFonts.montserratAlternates( // fuente del paquete google_fonts
                fontSize: 60,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
    );
  }
}