import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPage createState() => _SliderPage();
}

class _SliderPage extends State<SliderPage> {
  double _valorSlider = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            Expanded( // Se envolvio en el Widget "Expanded" para usar mejor
                      // el espacio
              child: _crearImagen()
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider( // el Widget usado para crear un Slider
      activeColor: Colors.amber, //personalizacion
      //divisions: 30, //personalizacion; se quito la division para mejorar
                       // el aumento de la imagen con el slider
      value: _valorSlider,  //Desde esta parte se define el movimiento
      min: 10,  // del slider en pantalla
      max: 400,
      onChanged: (valor) { // Esta parte hace que se redibuje el
        setState(() {    // estado y se muestre el cambio en pantalla
          _valorSlider = valor;
        });
      },
    );
  }

  Widget _crearImagen() { //Para que al mover el slider cambie el tamaño 

    return Image(
      image: NetworkImage('https://64.media.tumblr.com/8eb69f7ba6d621be1a8b64f0f55704b1/tumblr_o5w7c3Jja91rp0vkjo1_500.gif'),
      width: _valorSlider,
      fit: BoxFit.contain, //para que no se desencaje la imagen
    );
  }
}
