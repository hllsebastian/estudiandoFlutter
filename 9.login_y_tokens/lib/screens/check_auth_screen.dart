import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';


class CheckAuthScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // No se necesita redibujar, entonces se pone en false para que no escuche
    // los cambios del "authService" 
    final authService = Provider.of<AuthService>( context, listen: false );

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            
            if ( !snapshot.hasData )            
              return Text('');
            // Si no hay toquen devuelve a la LoginScreen 
            if ( snapshot.data == '' ) {
              // microtask, para que no saque error, porque el builder piden
              // que retorne  un widget. Se ejecutara cuando el builder termine
              // de ejecutar su funcion; tan pronto pueda se ejecuta
              Future.microtask(() {
                
              // Se usa el "Navigator.pushReplacement", para evitar la pantalla
              // de transicion, en el "pageBuilder: ( _, __ , ___ )" se usan los
              // guiones continuos para indicar que no se usara ese parametro 
                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: ( _, __ , ___ ) => LoginScreen(),
                  transitionDuration: Duration( seconds: 0)
                  )
                );

              });
            // Si hay toquen carga la "HomeScreen"
            } else {

              Future.microtask(() {

                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: ( _, __ , ___ ) => HomeScreen(),
                  transitionDuration: Duration( seconds: 0)
                  )
                );

              });
            }

            return Container();

          },
        ),
     ),
   );
  }
}