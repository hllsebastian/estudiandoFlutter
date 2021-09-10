import 'package:fluro/fluro.dart';

import 'package:bases_web/router/route_handlers.dart';

// Se define esta clases para definir como manejar las rutas

class Flurorouter {
  
  static final FluroRouter router = new FluroRouter();

  // El metodo estatico se podra llamar sin instanciar la clase
  static void configureRoutes() {

    // los "handler" es lo que quiero se ejecute, cuando el navegador
    // ingrese a la ruta que definamos para dicho handler 
    router.define('/', handler: counterHandler, transitionType: TransitionType.fadeIn );

    // Stateful Rotues
    // El "transitionType: TransitionType.fadeIn", permitira dar efecto de
    // animación a la transicion de la pagina. Tambien puede se le puede dar
    // duration y poner none, para no usar animacion
    router.define('/stateful', handler: counterHandler, transitionType: TransitionType.fadeIn );
    router.define('/stateful/:base', handler: counterHandler, transitionType: TransitionType.fadeIn );

    // Provider Routes
    router.define('/provider', handler: counterProviderHandler, transitionType: TransitionType.fadeIn );
    // Para hacer la prueba llamando una ruta con multiples segmentos
    router.define('/dashboard/users/:userid/:roleid', handler: dashboardUserHandler,transitionType: TransitionType.fadeIn);

    // 404 - Not Page Found
    // Aca se define si no hay rutas
    router.notFoundHandler = pageNotFound;

  }

}