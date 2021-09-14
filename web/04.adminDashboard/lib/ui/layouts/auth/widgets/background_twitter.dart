import 'package:flutter/material.dart';

class BackgroundTwitter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // El decoration y el color no son compatibles, solo debe usarse uno
        decoration: buildBoxDecoration(),
        child: Container(
                      // Para ayudar a ser responsive
          constraints: BoxConstraints( maxWidth: 400 ),
          child: Center(
            child: Padding( // para que la imagen no quede muy pegada a los
                            // bordes cuando se disminuye el tamaño de la ventana
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Image(
                image: AssetImage('twitter-white-logo.png'),
                width: 400,
              ),
            ),
          ),
        ),
      )
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        image: DecorationImage(
          image: AssetImage('twitter-bg.png'),
          fit: BoxFit.cover
        )
    );
  }
}

