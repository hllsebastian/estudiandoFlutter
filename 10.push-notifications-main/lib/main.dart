import 'package:flutter/material.dart';
import 'package:notificationes/services/push_notifications_service.dart';

import 'package:notificationes/screens/home_screen.dart';
import 'package:notificationes/screens/message_screen.dart';
 
void main() async {


  // "  WidgetsFlutterBinding.ensureInitialized", para que no saque error
  // ya que se quiere usar widgets sin aun inicializar el MaterialApp 
  WidgetsFlutterBinding.ensureInitialized();
  // Cuando se inicializa, se ve el token en la consola debug
  await PushNotificationService.initializeApp();

  runApp(MyApp());

}
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // Para navegar con las notificaciones
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  
  final GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() { 
    super.initState();
    
    // Context!
    // Para recibir el mesaje del Stream
    PushNotificationService.messagesStream.listen((message) { 

      // print('MyApp: $message');
      navigatorKey.currentState?.pushNamed('message', arguments: message);
      
      final snackBar = SnackBar(content: Text(message));
      messengerKey.currentState?.showSnackBar(snackBar);
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      navigatorKey: navigatorKey, // Navegar
      scaffoldMessengerKey: messengerKey, // Snacks
      routes: {
        'home'   : ( _ ) => HomeScreen(),
        'message': ( _ ) => MessageScreen(),
      },
    );
  }
}