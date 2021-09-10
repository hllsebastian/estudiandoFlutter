import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {

  int _counter = 15;

  // Para cambiar el tipo de dato de la base si es necesario
  CounterProvider( String base ) {
    if ( int.tryParse(base) != null ) 
      this._counter = int.parse(base);
  }

  get counter => this._counter;

  void increment() {
    this._counter++;
    notifyListeners();
  }

  void decrement() {
    this._counter--;
    notifyListeners();
  }

}

