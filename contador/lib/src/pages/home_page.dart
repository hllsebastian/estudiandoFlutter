import 'package:contador/src/pages/contador_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
 
 @override
  Widget build( context) {

    return MaterialApp(
      home: Center(
        child: ContadorPage(),
      )  
    );
  }

 
}
