import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


// Se obtiene cuando se configura Firebase -> documentacion de FirebaseFlutter
//.. en el comando de android ejecutar "cd android ./gradel" (no lo escribi com-
// pleto )  
// SHA1: 1D:4F:38:94:62:06:9F:C6:75:A7:73:BD:E4:B0:DA:27:80:B1:9D:F0
// P8 - KeyID: VYZH37GGZ9

class PushNotificationService {

  // "FirebaseMessaging", del paquete "firebase_messaging/firebase_messaging.dart"
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  // token es lo que buscamos generar 
  static String? token;

  // "StreamController", del paquete 'dart:async'.
  // se genera para que el main pueda escucharlo.
  // Sirve para emitir informacion.
  static StreamController<String> _messageStream = new StreamController.broadcast();
  // Para suscribirlo en el main
  static Stream<String> get messagesStream => _messageStream.stream;

  // DEFINIENDO LOS DIFERENTES TIPOS DE NOTIFICACION
  static Future _backgroundHandler( RemoteMessage message ) async {
    // print( 'onBackground Handler ${ message.messageId }');
    print( message.data );
    // Cuando se recibe una notificacion se añade al Stream
    _messageStream.add( message.data['product'] ?? 'No data' );
  }

  static Future _onMessageHandler( RemoteMessage message ) async {
    // print( 'onMessage Handler ${ message.messageId }');
    print( message.data );
    _messageStream.add( message.data['product'] ?? 'No data' );
  }

  static Future _onMessageOpenApp( RemoteMessage message ) async {
    // print( 'onMessageOpenApp Handler ${ message.messageId }');
    print( message.data );
    _messageStream.add( message.data['product'] ?? 'No data' );
  }



  static Future initializeApp() async {

    // Push Notifications
    // "Firebase", del paquete "firebase_core/firebase_core.dart"
    // Este metodo se usa para obtener el token del usuario y se debe ejecutar
    // antes de recibir cualquier notificacion, por lo que se debe llamar
    // en el main     
    await Firebase.initializeApp();
    await requestPermission();

    token = await FirebaseMessaging.instance.getToken();
    print('Token: $token');

    // Para manejar los handlers
    // Handlers
    FirebaseMessaging.onBackgroundMessage( _backgroundHandler );
    FirebaseMessaging.onMessage.listen( _onMessageHandler );
    FirebaseMessaging.onMessageOpenedApp.listen( _onMessageOpenApp );

    // Local Notifications
  }

  // Apple / Web
  static requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true
    );

    print('User push notification status ${ settings.authorizationStatus }');

  }

  // El StreamCotroller pide definir el cierre, aunque no se implemente, porque
  // siempre la app estara pendiente a recibir notificaciones 
  static closeStreams() {
    _messageStream.close();
  }
}