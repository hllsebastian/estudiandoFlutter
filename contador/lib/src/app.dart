import 'package:flutter/material.dart';

import 'package:contador/src/pages/home_page.dart';


class MyApp extends StatelessWidget {
  /* La clase (widget) MyApp hereda las 
                          propiedades y metodos de la clase 'StatelessWidget' */

  @override
  Widget build(context) {
    /* se sobreescribe el metodo 'build' del 'StatelessWidget'
                          con el argumento (context) que contiene la informacion
                          del arbol del widget. Este debe retornar un 'Widget' */

    return MaterialApp(
      /*´MaterialApp´: el widget que retonarna el metodo 'build' permitira usar 
        diferentes parametros por nombre para editar la app., osea, que se esta
        llamando a un constructor. */
      debugShowCheckedModeBanner: false,
      home: Center(
        child: HomePage(),
      ),
    );
  }
}
