import 'package:flutter/material.dart';


// Se crea una "GlobalKey" que sirva como referencia para instanciar la navegacion.
// Se trata de hacer algo similar a un singleton 

class NavigationService {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future navigateTo(String routeName) {
   return navigatorKey.currentState!.pushNamed(routeName); 
  }

  void goBack(String routeName) {
   return navigatorKey.currentState!.pop(routeName); 
  }
}

// Se omite el uso de esta instancia para implementar el paquete GetIT
//final navigationService = NavigationService();
  