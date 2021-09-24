import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

// Se descargo en el pubspec el paquete de dio, como alternativa al paquete
// HTTP, servira para hacer peticiones HTTP y para cofigurar el header 

class CafeApi {

  static Dio _dio = new Dio(); // Se crea la primera instancia de DIO
  

  // Se llamara cuando la aplicacion es construida 

  static void configureDio() {

    // Base del url -> donde se tiene corriendo el servidor; es una constante en la app
    _dio.options.baseUrl = 'http://localhost:8080/api'; 

    // Configurar Headers -> ya lo habiamos creado
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };

  }


  // PETICIONES HTTP
  //
  // Se asigno el parametro como "path"porque seria la ruta: "/usuario", 
  // "/categorio", etc.

  static Future httpGet( String path ) async {   //  GET
    
    try { // Para controlar errores
      
      final resp = await _dio.get(path); 

      return resp.data;
    } catch (e) {
      print(e);
      throw('Error en el GET');
    }
  }


    // POST para la creacion de usuario
 
    static Future post( String path, Map<String, dynamic> data ) async { 

      // "FormData.fromMap(data)" viene con el paqueete de DIO

      final formData = FormData.fromMap(data);

      try {
        
        final resp = await _dio.post(path, data: formData );
        return resp.data;

      } catch (e) {
        print(e);
        throw('Error en el POST');
      }
    }


}