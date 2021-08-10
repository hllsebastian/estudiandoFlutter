import 'package:flutter/material.dart';
import 'package:movieapp/providers/movies_provider.dart';
import 'package:movieapp/screens/screen.dart';
import 'package:provider/provider.dart'; // en esta pagina se unificaron 
// las rutas a otros archivos autonomos
 

 
void main() => runApp(AppState());


class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy: false),
      ],
      child: MyApp(),
    );
  }
}

 
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