import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';

 
 // Se uso el "AppState" en lugar de "MyApp" para correr la aplicacion
void main() => runApp(AppState());


class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // el "MultiProvider" se usa cuando se van a crear varios Providers
    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider(create: ( _ ) => ProductsService()),
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
      title: 'Productos App',
      initialRoute: 'home',
      routes: {
        'login'   : ( _ ) => LoginScreen(),
        'home'    : ( _ ) => HomeScreen(),
        'product' : ( _ ) => ProductScreen(),
      },

      // Para darle una apariencia global a los "appBar "
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.indigo
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          elevation: 0
        )
      ),
    );
  }
}