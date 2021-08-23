import 'package:flutter/material.dart';


// Gestor de estado, ayudara a mantener la estructura global y realizar
// cambio solo en las propiedades especificadas. El "ChangeNotifier" 
// permitira que la clase se use dentro de un  "ChangeNotifierProvider"
// "Multiprovider"   

class LoginFormProvider extends ChangeNotifier {

  // Por fin usamos el "GlobalKey" que es una referencia a un widget,
  // se ponde el tipo de widget + state "<FormState>"

  // Para integrar el "formKey" a la referencia de un widget se recomienda,
  // al menos en este caso, hacerlo envolviendo la clase dentro de un
  // "ChangeNotifierProvider" 

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email    = '';
  String password = '';


  // Para que el boton de "Ingreso" se deshabilite cuando se ingresan los
  // datos y se espera que sean enviados al backend 
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  // Cuando el "isLoading" se le establesca un valor, ese valor se establecera
  // al "_isLoading" y notificara a todos los widgets dentro de "LoginFormProvider"
  // que esten escuchando los cambios 
  set isLoading( bool value ) {
    _isLoading = value;
    notifyListeners(); // 
  }

  
  bool isValidForm() {

    print(formKey.currentState?.validate());

    print('$email - $password');

    return formKey.currentState?.validate() ?? false;
  }

}