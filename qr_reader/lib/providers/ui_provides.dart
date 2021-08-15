
import 'package:flutter/material.dart';


// Se usa para saber cual sera el indide seleccionado en la app, es decir
// la pagina que mostrara cuando se haga tap


class UiProvider extends ChangeNotifier {// El "ChangeNotifier" notificara a los
// widgets que estan escuchando cuando la propiedad cambio

  int _selectedMenuOpt = 1;

  int get selectedMenuOpt => this._selectedMenuOpt;
  

  set selectedMenuOpt (int i ) {
    this._selectedMenuOpt = i;
    notifyListeners(); //  Notifica a los widgtes escuchantes sobre el cambio
  }



}





