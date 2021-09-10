import 'package:fluro/fluro.dart';

import 'package:bases_web/ui/views/counter_provider_view.dart';
import 'package:bases_web/ui/views/counter_view.dart';
import 'package:bases_web/ui/views/view_404.dart';


// Aca se definen los handlers, cada uno va a regresar una parte de la pagina
// y se les asigna una rauta 

//  Se definen las rutas con una varible igualada a "Handler", esta tiene los
// parametros para usar el context y la ruta 
//  
// Handlers -> usando el "handlerFunc:" Tiene el BuildContext para cuando se 
//requiera trabajar con un gestor de estado y map <String> y List <String>, que 
//serviran para usar los argumentos y segmentos de una URL 
// 
// Para este proyecto las paginas no se usaran, se trabajara en vase a vistas,
// por esto se llaman los widgets de vista  



// Se retornara el widget que se quiere mostrar y el  
final counterHandler = Handler(
  handlerFunc: ( context , params ){  
    // Condicionamiento de la ruta, para que aparezca un valor si el argumento
    // definido (base) es nulo. 
    // El ".first" indica que es la posicion
    return CounterView( base: params['base']?.first ?? '5' );
  }
);

final counterProviderHandler = Handler(
  handlerFunc: ( context , params ){ 
    return CounterProviderView( base: params['q']?.first ?? '10' );
  }
);

// Se definio esta ruta como prueba y hacer el print de los parametros
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