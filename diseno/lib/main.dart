import 'package:flutter/material.dart';

import 'screens/diseños_basicos.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'basic_design', // basado en rutas????
      routes: {
        'basic_design': (_) => BasicDesignScreen(), // "_" para indicar que el argumento no interesa
      },
    );
  }
}
