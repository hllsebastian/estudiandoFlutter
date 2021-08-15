import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/home.dart';
import 'package:qr_reader/pages/mapa_page.dart';
import 'package:qr_reader/providers/ui_provides.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider( // le indicara a la app que busque en el arbol 
      // de widgets el "IuProvider", para tener acceso a la propiedad que se
      // requiere cambiar

      providers: [

        //"create": cuando no hay una instancia creada en el provider
        ChangeNotifierProvider(create: (_) => new UiProvider()),


      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title       : 'QR Reader',
        initialRoute: 'home',
        routes      : {
          'home': (_) => HomePage(),
          'mapa': (_) => MapaPage(),
        },
      
        theme: ThemeData( // Para personalizar el tema de  la aplicacion
          primaryColor: Colors.blueGrey,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.blueGrey
          )
    
        )
      ),
    );
  }
}