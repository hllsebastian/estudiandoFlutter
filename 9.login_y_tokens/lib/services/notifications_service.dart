import 'package:flutter/material.dart';

// Para mostrar alerta cuando el usuario pone un login incorrecto

// No se extiende a un ChangeNotifier, porque no sus metodos y propiedades 
// no redibuaran nada redibujar, solo se reutilizaran en cualquier parte de
// la app 

class NotificationsService {

// Cuando se necesita mantener el estado de alguna llave, usualamente tendra
// el tipado con la palabra State -> "ScaffoldMessengerState" 
// "new GlobalKey<ScaffoldMessengerState>()" -> para mantener la referencia
// a mi MaterialApp 
  static GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();


  static showSnackbar( String message ) {

    final snackBar = new SnackBar(
      content: Text( message, style: TextStyle( color: Colors.white, fontSize: 20) ),
    );

    messengerKey.currentState!.showSnackBar(snackBar);

  }


}