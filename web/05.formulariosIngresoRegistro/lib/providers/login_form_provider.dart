import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {

  // Se defina el key para dispara los mensajes, este key se debe asociar con
  // el "key:" (constructor del LoginView) 
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email    = '';
  String password = '';

  // validateForm(), metodo del Widget Form

  // Si el formulario es valido retorna true, si no un false
  bool validateForm() {

    if ( formKey.currentState!.validate() ) {
      // print('Form valid ... Login');
      // print('$email === $password');
      return true;
    } else {
      // print('Form not valid');
      return false;
    }

  }


}