import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/diseños_basicos.dart';
import 'screens/home_screen.dart';
import 'screens/scroll_desing.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  
  // Para ponerle tema dark o light a la barra, tiene otras personalizaciones 
  // con "(SystemUiOverlayStyle.light.copyWith(statusBarIconBrightness:Brightness.dark )"
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarIconBrightness:Brightness.dark ));


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home_screen', // basado en rutas????
      routes: {
        'basic_design' : (_) => BasicDesignScreen(), // "_" para indicar que el argumento no interesa
        'scroll_desing': (_) => ScrollDesign(), // "_" para indicar que el argumento no interesa
        'home_screen'  : (_) => HomeScreen(), // "_" para indicar que el argumento no interesa
      },
    );
  }
}
