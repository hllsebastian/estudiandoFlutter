import 'package:bases_web/locator.dart';
import 'package:bases_web/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:bases_web/router/route_generator.dart';
import 'package:bases_web/ui/layout/main_layout_page.dart';
 


void main() {
  setupLocator(); // Aca se inicializa el "setupLocator()", que se definio con el paquete GetIt,
                  // para tener acceso a los servicios de la instancia "locator" 
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title       : 'Bases Web con Flutter', // Titulo de la ventana del navegadador
      initialRoute: '/stateful',
    /*routes      : {                  // Estableciendo rutas
        '/statefull': (_) =>   CounterPage(),
        '/provider' : (_) =>   CounterProviderPage(),
      }, */
      onGenerateRoute: RouteGenerator.generateRoute, // Se definio la clase
                      // "RouteGenerator.generateRoute" con la funcion asociada
                      // para controlar la navegacion. Aca se define la ruta

      // Se usara este key para la navegacion -> "navigatorKey"
      navigatorKey: locator<NavigationService>().navigatorKey, // Llamando la
              // funcione "locator" tipo  NavigationService y el navigatorKey,
              // se podran consumir los metodos de navegacion establecidos 

      builder: (_, child) {
        return MainLayoutPage(child: child ?? Container()
        ); // Acá se construye la navegacion
      } 
    );
  }
}