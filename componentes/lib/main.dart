import 'package:flutter/material.dart';

import 'package:componentes/src/routes/routes.dart';

import 'package:componentes/src/pages/alert_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes APP',
      initialRoute: '/',

      /// Aca se asigno la ruta principal.
      ///Se definieron las rutas en el archivo "routes" para accedeer a diferentes paginas
      routes: getApplicatioRoutes(),

      onGenerateRoute: (RouteSettings settings) {
        print('ruta llamada: ${settings.name}');

        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()  
          );

      },

      //home: HomePage()
    );
  }
}
