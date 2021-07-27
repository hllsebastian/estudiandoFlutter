/// Se importa este paquete para convertir el json, se indica que "show" para
/// que especificamente solo se use la funcion de conversion
import 'package:flutter/services.dart' show rootBundle;

/// Se importa el paquete dart:convert para usar la funciones json.decode y
/// pasar el jsonString a un map
import 'dart:convert';

/// Se crea la Clase "_MenuProvider" para definir la conversion del json.
///   1- se crea la propiedad tipo list "opciones" para contener los datos
///      convertidos.
///   2- se crea el constructor "_MenuProvider()" con el metodo "cargardata"
///      que convertira el json.
///   3- se define el metodo "cargardata" para ejecutar la conversion del json.
///      Esta conversion se hace con la funcion:
///           "rootBundle.loadString(ruta de la carpeta).then(){}".
///   4. se define una nueva instancia para "_MenuProvider" con "menuProvider".

class _MenuProvider {
  List<dynamic> opciones = []; //...........1

  _MenuProvider() {
    //....................2
    //cargarData();
  }

  /// A la clase se le cambio el constructor "_MenuProvider" por "cargarData", 
  /// para que permitiera resolver primero el "rootBundle" y posteriormente
  /// retornara la lista de "opciones"
  Future<List<dynamic>> cargarData() async {
    //........................3

    final resp = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(resp);
    print(dataMap['rutas']);
    opciones = dataMap['rutas'];

    return opciones;
  }
}

final menuProvider = _MenuProvider(); //.....4
