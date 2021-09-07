import 'package:flutter/material.dart';


// Se creo la clase que extiende a "ChangeNotifier" para usar el Provider
// con la finaliada de redibujar "counter_page" sin tener que
// usar el stateful  

class CounterProvider extends ChangeNotifier {
  

  int _counter = 15; // Propiedad que se redibujara en pantalla

  get counter => this._counter; // "this." refiere a la propiedad dentro de 
                                // este contexto  

  void increment() {
    this._counter++;  // Incremento
    notifyListeners();
  }

  void decrement() {
    this._counter--; // decremento
    notifyListeners();
  }
}
