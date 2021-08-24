import 'package:flutter/material.dart';

//para definir un idioma
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:componentes/src/routes/routes.dart';

import 'package:componentes/src/pages/alert_page.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [ // metodos y propiedades para definir el idioma
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
     
      ],
      supportedLocales: [
        Locale('en', 'US'), // English, no country code
        Locale('es', 'ES'), // Spanish, no country code
      ],
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
