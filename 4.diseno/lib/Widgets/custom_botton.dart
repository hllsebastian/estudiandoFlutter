import 'package:flutter/material.dart';



class CustomBottomNavigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      
      showSelectedLabels: false, // para quitar el texto que acompoña al icono
      showUnselectedLabels: false, // para quitar el texto que acompoña al icono


      selectedItemColor: Colors. pink,
      backgroundColor: Color.fromRGBO(55, 57, 84, 1),
      unselectedItemColor: Color.fromRGBO(116, 117, 52, 1),

      currentIndex: 1, // Para darle una posicion a la seleccion

      items: [

        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today, size: 30),
          label:'Calendario', 

        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart_outline, size: 30),
          label:'Calendario', 

        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle, size: 30),
          label:'Calendario', 

        )
      ]
    );
  }
}