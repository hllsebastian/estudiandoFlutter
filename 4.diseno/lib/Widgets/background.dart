import 'dart:math';

import 'package:flutter/material.dart';


class Background extends StatelessWidget {

  final boxDecoration = BoxDecoration(
          gradient: LinearGradient(

            begin : Alignment.topCenter,
            end   : Alignment.topCenter,
            colors: [
              Color(0xff2E305F),
              Color(0xff202333),
            ]

          )
        );

  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: [
        // Purple gradient
        Container(
          decoration: boxDecoration),
        // Pink box
        Positioned(
          top: -100,
          left: -30,
          child: _PinkBox())


      ],
    );
  }
}


class _PinkBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 6,
      child: Container(
        width : 340,
        height: 340,
        decoration: BoxDecoration( // Para personalizar
    
          color: Colors. pink,
          borderRadius: BorderRadius.circular(80), // Bordes de la esquina
          gradient    : LinearGradient( // darle efecto gradual al color
            colors:[
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(241, 142, 172, 1),
    
    
            ]),
    
        ),
    
      ),
    );
  }
}