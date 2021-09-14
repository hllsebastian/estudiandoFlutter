

import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';



// Provider para la autenticacion, se manejara de manera global en comparacion
// a los demas Providers, porquee en todo momento se requiere saber si se
// el usuario tiene acceso a la app y quien es


// Estados en los que se encontrara la autenticacion
enum AuthStatus {
  checking,  // revisando estado
  authenticated, // autenticado
  notAuthenticated // no autenticado
}

class AuthProvider extends ChangeNotifier {

  // Para saber si esta autenticado
  String? _token;

  // Cuando se esta creando por primera vez la instancina de autenticacion se
  // esta revisando el estado 
  AuthStatus authStatus = AuthStatus.checking;


  AuthProvider() {
    this.isAuthenticated();
  }

  // Aca se realizara la peticion HTTP
  login( String email, String password ) {

    // TODO: Petición HTTP

    // Aca se esta dando un token y se esta haciendo el acceso al LocalStorage
    // para guardarlo 
    this._token = 'adjkfhadfyiu12y3hjasd.ajskhdaks.kjshdkjas';
    LocalStorage.prefs.setString('token', this._token! );
    
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  // Metodo para saber si la persona esta autenticada
  Future<bool> isAuthenticated() async {

    final token = LocalStorage.prefs.getString('token');

    // Si no esta autenticado retorna falso
    if( token == null ) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    // TODO: ir al backend y comprobar si el JWT es válido
    
    // Si esta autenticado return true y notificara a los listeners

    await Future.delayed(Duration(milliseconds: 1000 ));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }


}
