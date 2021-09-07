import 'package:fluro/fluro.dart';

import 'package:bases_web/ui/views/counter_provider_view.dart';
import 'package:bases_web/ui/views/counter_view.dart';
import 'package:bases_web/ui/views/view_404.dart';


// Aca se definen los handlers, cada uno va a regresar una parte de la pagina
// y se les asigna una rauta 

// Handlers

final counterHandler = Handler(
  handlerFunc: ( context , params ){  
    return CounterView( base: params['base']?.first ?? '5' );
  }
);

final counterProviderHandler = Handler(
  handlerFunc: ( context , params ){ 

    return CounterProviderView( base: params['q']?.first ?? '10' );
  }
);

final dashboardUserHandler = Handler(
  handlerFunc: ( context , params ){ 
    print( params );
    return View404();
  }
);

// 404
final pageNotFound = Handler(
  handlerFunc: ( _ , __ ) => View404()
);