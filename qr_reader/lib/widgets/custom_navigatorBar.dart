import 'package:flutter/material.dart';



class CustomNavigatorBar extends StatelessWidget {

  final currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex, // Para indicar cual boton se deja seleccionado
      elevation: 0, // Quita la raya que viene por defecto
      items: [
        
        BottomNavigationBarItem(
          // Para mostrar coordenadas
          icon : Icon(Icons.map),
          label: 'Mapa',
        ),
       
        BottomNavigationBarItem(
          // Para mostrar direcciones
          icon : Icon(Icons.compass_calibration),
          label: 'Direcciones',
        ),
      ]
    
    );
  }
}


