import 'package:flutter/material.dart';

// Aca se hace la animacion para que mostrar y ocultar automaticamente
// el sidebar, cuando es inferior a 700px

class SideMenuProvider extends ChangeNotifier {
  // Ayudara a controlar la animacion para ocultar y mostrar el sidebar
  static late AnimationController menuController;
  // Para saber cuando el sidebar esta abierto
  static bool isOpen = false;

  String _currentPage = ''; // Propiedad para definir cuando debe mantenerse marcada la opcion
                          // dependiendo la vista actual 

  String get currentPage { // Se manejara marcar la opcion con un get
    return _currentPage;
  }

  void setCurrentPageUrl(String routeName) { // Se define este metodo para establecer que se esta 
                                            // sobre una ruta
    _currentPage = routeName;
    Future.delayed(Duration(milliseconds: 100), () { // Para que no se construya a la vez que se 
                            // construye la pagina
      notifyListeners();
    });
  }


  // Para darle movimiento. Se usa el "menuController"; "curve: Curves.easeInOut"
  // sirve para desacelerar la animacion 
  static Animation<double> movement = Tween<double>(begin: -200, end: 0)
      .animate(
          CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  // Para darle opaciodad cuando el menu aparesca
  static Animation<double> opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  // Metodos basicos para un controlador de menu
  //
  //  
  static void openMenu() { // El "forward" dispara la animacion. Todo lo que este
                           // definido como "Animation" -> de -200 a 0, para este caso
    isOpen = true;
    menuController.forward();
  }

  static void closeMenu() { // Reversa el foward -> de 0 a -200
    isOpen = false;
    menuController.reverse();
  }

  static void toggleMenu() {  // Abierto a cerrado, cerrado a abierto.
                              // Este metodo no sera llamadao, solo se queria
                              // mostrar su implementacion
    (isOpen) ? menuController.reverse() : menuController.forward();

    isOpen = !isOpen;
  }
}
