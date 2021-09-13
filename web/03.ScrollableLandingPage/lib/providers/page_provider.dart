// import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

// Se usa provider para poder mover la vista del contenido segun la opcion
// seleccionada en el menu. Como se requiere de manera global, se llamara
// en el main

class PageProvider extends ChangeNotifier {
  PageController scrollController = new PageController();

// El listado para relacionar la posicion de los nombres del menu y usarlos para
// asignar un fragmento de url cuando se haga cambio de vista desde el menu
  List<String> _pages = ['home', 'about', 'pricing', 'contact', 'location'];

// para hacer cambio vista; se uso en el metodo "goTo(int index)"
  int _currentIndex = 0;

  // Aca se definio el metodo para ingresar a una vista por URL y tambien que
  // que cargue el nombre de la URL segun la vista que se ve, cuando se da scroll  
  createScrollController(String routeName) {
    this.scrollController =
        new PageController(initialPage: getPageIndex(routeName));

    // Aca se definio el titulo de la pagina segun la vista que este mostrando
    html.document.title = _pages[getPageIndex(routeName)];

    this.scrollController.addListener(() {
      final index = (this.scrollController.page ?? 0).round();

      if (index != _currentIndex) {
        html.window.history.pushState(null, 'none', '#/${_pages[index]}');
        _currentIndex = index;
        html.document.title = _pages[index];
      }
    });
  }

  int getPageIndex(String routeName) {
    return (_pages.indexOf(routeName) == -1) ? 0 : _pages.indexOf(routeName);
  }

  // Se definio un metodo para hacer el cambio de pagina segun el index en el
  // que se haga click
  goTo(int index) {
    // "window" fue importado del paquete "package:universal_html" (pubsdev). Se usa
    // para establecer un nombre a un segmento de la url cuando se cambia de
    // pagina  "#/${ _pages[index]"

    // final routeName = _pages[index];
    html.window.history.pushState(null, 'none', '#/${_pages[index]}');

    scrollController.animateToPage(
        // "animateToPage" para hacer el cambio del page
        index,
        duration: Duration(milliseconds: 300),
        curve:
            Curves.easeInOut // La animacion que se le da cuando hace el cambio
        );
  }
}
