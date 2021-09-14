import 'package:flutter/material.dart';

// Aca se centralizo la forma para crear los inputs

class CustomInputs {

  static InputDecoration loginInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }){
    return InputDecoration(
      border: OutlineInputBorder( // Para darle formato a los bordes
        borderSide: BorderSide(color: Colors.white.withOpacity(0.3))
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withOpacity(0.3))
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon( icon, color: Colors.grey ),
      labelStyle: TextStyle( color: Colors.grey ),
      hintStyle: TextStyle( color: Colors.grey ),
    );
  }


}