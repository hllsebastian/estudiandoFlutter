import 'package:flutter/material.dart';import 'package:flutter/cupertino.dart';
// Paquete para definir si la navegacion es pagina web o en app movil 
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:bases_web/ui/views/counter_provider_view.dart';
import 'package:bases_web/ui/views/counter_view.dart';
import 'package:bases_web/ui/views/view_404.dart';


// Asi se manejara la navegacion de la pagina. En el main (onGenerateRoute) 
// llamaremos la funcion "generateRoute" de la clase aca creada 
//   

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {

      case '/stateful':
       return _fadeRoute(CounterView(), '/stateful');
       
      
      case '/provider':
       return _fadeRoute(CounterProviderView(), '/provider');

      
      default:  
       return  _fadeRoute(View404(), '/404');

    }
  }

  // Aca se optimiza el codigo para definir los casos de navegacion. Se usaron
  // como parametros el widget en el que se definio la pagina y el nombre de su
  // ruta  
  static PageRoute _fadeRoute(Widget child, String routeName) {

    return PageRouteBuilder(
      settings          : RouteSettings(name: routeName),
      pageBuilder       : (_, __, ___) => child,
      transitionDuration: Duration(milliseconds: 200), // Se le puede quitar
      transitionsBuilder: (_, animation, __, ____ ) =>
        (kIsWeb)    // Se usa para identificar si la navegacion se esta haciendo
                    // desde pagina web o app movil, para este caso se usa 
                    // para condicionar la animacion cuando se hace transicion
                    // de una pagina a otra 
        ? FadeTransition(
          opacity: animation,
          child  : child,
        ) 
        : CupertinoPageTransition(
          primaryRouteAnimation: animation, 
          secondaryRouteAnimation: __, 
          child: child, 
          linearTransition: true
        )
    );
  }

}

