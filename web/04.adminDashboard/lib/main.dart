import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:flutter/material.dart';
 
void main(){

  // Antes de que se ejecute el "runApp(MyApp())" debe llamarase el
  // configurador de las rutas 

  Flurorouter.configureRoutes();
  runApp(MyApp());
}
  
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      builder: ( _ , child ){ // Este child es la parte que se redinzara 

        return AuthLayout( child: child! ); 

      },
      theme: ThemeData.light().copyWith( // Aca se le dio color al Scrollbar
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(
            Colors.grey.withOpacity(0.5)
          )
        )
      ),
    );
  }
}