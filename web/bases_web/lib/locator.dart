import 'package:get_it/get_it.dart'; 
import 'package:bases_web/services/navigator_service.dart';


// Este paquete servira para centralizar los singletons, se usaran como clases

GetIt locator = GetIt.instance; 

// En cualquier lugar de la apliacion se podra usar "locator" y se tendra
// acceso al  "navigationService()".
// Para usar el  "setupLocator()" se llama dentro del metodo main de la aplicacion
// 


void setupLocator() => locator.registerLazySingleton(() => NavigationService());



