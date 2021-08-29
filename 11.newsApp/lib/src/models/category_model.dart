import 'package:flutter/material.dart';


// Modelo para crear un widget que permita seleccionara la categoria.
// Se creo esta clase para usarla como tipo de un listado donde 
// se ingresaran las categorias de las noticias en la carpeta "news_services" 

class Category {
  final IconData icon;
  final String name;

  Category(this.icon, this.name);
}