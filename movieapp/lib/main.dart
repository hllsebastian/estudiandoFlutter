import 'package:flutter/material.dart';
import 'package:movieapp/screens/screen.dart'; // en esta pagina se unificaron 
// las rutas a otros archivos autonomos
 

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {
        'home'    : ( _ ) => HomeScreen(),
        'details' : ( _ ) => DetailsScreen(),
      },
      theme: ThemeData.dark().copyWith( // para darle fondo al fondo
        appBarTheme: AppBarTheme(
          color: Colors.redAccent,
        )
      ),
    );
  }
}