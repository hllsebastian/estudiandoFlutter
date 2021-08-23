import 'package:flutter/material.dart';

// Aca se le dio formato al campo donde se ingresara el correo y
// la contraseña.
// Se definio esta clase para tener acceso a sus propiedades y metodos

class InputDecorations {

  static InputDecoration authInputDecoration({
    
    // Para indicar que estos argumentos son obligatorios ingresarlos
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }) {


    return InputDecoration(
        enabledBorder: UnderlineInputBorder( // Da aspecto de una linea inferior
                        // en el campo de ingreso de datos  
          borderSide: BorderSide(
            color: Colors.deepPurple
          ),
        ),
        focusedBorder: UnderlineInputBorder( // Da aspecto de una linea inferior
                        // cuando se ingresa al campo los datos correctos
          borderSide: BorderSide(
            color: Colors.deepPurple,
            width: 2
          )
        ),
        hintText: hintText, // Cuando se da tap al campo, aparece este texto  
        labelText: labelText, // Texto predefinido en el fondo del campo
        labelStyle: TextStyle(
          color: Colors.grey
        ),
        prefixIcon: prefixIcon != null 
          ? Icon( prefixIcon, color: Colors.deepPurple )
          : null
      );
  }  

}