
import 'package:shared_preferences/shared_preferences.dart';


// Para guardar el token en el storage local, se importo el paquete "shared_preferences".
// El configurePrefs se llamara antes de inicializar la app  

class LocalStorage {

  static late SharedPreferences prefs;

  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

}
