import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  
  final Widget child; // Para construir el area donde se ingresara
                      // la info.

  const AuthBackground({ // Este argumento debera ingresarse en el
    Key? key,            // "login_screen", donde lo estamos llamando 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.red,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [

            _PurpleBox(), // Aca se hizo el fondo morado con burbujas

            _HeaderIcon(), // Aca se hizo el icono de persona o contacto sobre
                          // el fondo morado 

            this.child, // Aca se llama "this.child" para  observar el 
                        //Widget en pantalla

          ],
        ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea( // Ayuda a dar una separacion arriba, util para las 
                    // con notch
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only( top: 30 ),
        child: Icon( Icons.person_pin, color: Colors.white, size: 100 ),
      ),
    );
  }
}


class _PurpleBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Para personalizar el tamañao de la pantalla con porcentaje
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4, // tamaño (0.4 = 40%)
      decoration: _purpleBackground(),
      child: Stack( // "Stack" que permite poner un widget sobre otro
        children: [  // "Positioned" funciona dentro del "Stack" y permite
                    // cambiar la posicion de "_Buble" 
          Positioned(child: _Bubble(), top: 90, left: 30 ),
          Positioned(child: _Bubble(), top: -40, left: -30 ),
          Positioned(child: _Bubble(), top: -50, right: -20 ),
          Positioned(child: _Bubble(), bottom: -50, left: 10 ),
          Positioned(child: _Bubble(), bottom: 120, right: 20 ),
        ],
      ),
    );
  }

  BoxDecoration _purpleBackground() => BoxDecoration(
    gradient: LinearGradient( // Para dar efecto de gradiente al color
      colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ]
    )
  );
}

class _Bubble extends StatelessWidget { // Para hacer figuras con forma de circulo

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );
  }
}