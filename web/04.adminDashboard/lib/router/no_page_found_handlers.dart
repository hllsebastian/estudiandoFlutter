import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/ui/views/no_page_found_view.dart';

// Se creo este handler en un archivo independiente para reutilizarlo en
// caso de que crezca las clases para los 404 
class NoPageFoundHandlers {

  static Handler noPageFound = Handler(
    handlerFunc: ( context, params ) {
      return NoPageFoundView();
    }
  );


}

