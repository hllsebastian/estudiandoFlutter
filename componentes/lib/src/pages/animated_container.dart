import 'package:flutter/material.dart';
import 'dart:math';


class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.pink;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer( 
          curve: Curves.bounceOut,
          duration: Duration(milliseconds: 500),
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.double_arrow),
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: _formaChange, // en este metodo se dio forma al "animated"
      ),
    );
  }

  void _formaChange() {

    final random = Random(); /*se importa el paquete "dart:math" para que haga
    una seleccion aleatoria de las propiedades del "AnimatedContainer" con el 
    metodo ".nextInt()" */

    setState(() {
      _width  = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color  = Color.fromRGBO(
        random.nextInt(255), 
        random.nextInt(255), 
        random.nextInt(255), 
        1);
      _borderRadius = BorderRadius.circular(random.nextInt(300).toDouble());

    });
  }
}
