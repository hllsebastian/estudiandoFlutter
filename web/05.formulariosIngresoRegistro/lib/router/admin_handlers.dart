import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:fluro/fluro.dart';

import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/register_view.dart';
import 'package:provider/provider.dart';

// Aca se definio el controlador del dashboard

class AdminHandlers {

  static Handler login = Handler(
    handlerFunc: ( context, params ) {

      // PARA LOGIN

      // Si el estado de autenticacion es "AuthStatus.notAuthenticated",
      // entonces regresara la vista de login, de lo contrario regresara
      // la vista AuthStatus.notAuthenticated

      final authProvider = Provider.of<AuthProvider>(context!);

      if ( authProvider.authStatus == AuthStatus.notAuthenticated )
        return LoginView();
      else 
        return DashboardView();

    }
  );

  static Handler register = Handler(
    handlerFunc: ( context, params ) {
      
      // PARA REGISTRO

      // Si el estado de autenticacion es "AuthStatus.notAuthenticated",
      // entonces regresara la vista de registro, de lo contrario regresara
      // la vista del DashboardView

      final authProvider = Provider.of<AuthProvider>(context!);
      
      if ( authProvider.authStatus == AuthStatus.notAuthenticated )
        return RegisterView();
      else 
        return DashboardView();
    }
  );


}

