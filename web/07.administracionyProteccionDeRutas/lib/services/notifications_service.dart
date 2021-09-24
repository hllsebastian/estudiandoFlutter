import 'package:flutter/material.dart';


// Aca se creo el snackbar que mostrara un mensaje cuando los datos de usuario
// y contraseña son inconrrectos. 

class NotificationsService {

  // Se define GlobalKey para llamarlo en el "scaffoldMessengerKey" del Main 
  // y asi usarlo en cualquier sitio de la app 
  static GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();


  static showSnackbarError( String message ) {

    final snackBar = new SnackBar(  // widget para definir snackbar
      backgroundColor: Colors.red.withOpacity(0.9),
      content: Text( message, style: TextStyle( color: Colors.white, fontSize: 20 ) )
    );

    // Metodo para mostrar el snackBar
    messengerKey.currentState!.showSnackBar(snackBar);
  }
}