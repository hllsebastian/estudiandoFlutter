/* Los 'Statefulwidgets estan compuestos por dos clases:
    1. el statefulwidget como tal.
    2. el estado que manejara el Statefulwidget.

    Se utiliza el "_" para espicificar que los metodos y clases no se usuaran
    fuera de este archivo.

' */


import 'package:flutter/material.dart';


class ContadorPage extends StatefulWidget {
  
 @override
  createState() => _ContadorPageState();
  

}

class _ContadorPageState extends State<ContadorPage> {


  final TextStyle _estiloTexto = TextStyle(fontSize: 35);
  int _conteo = 0; // variable para inicializar una funcion de conteo

 @override
  Widget build(BuildContext context) {
    return Scaffold(  //Tiene argumentos para dar estilo a la pagina.
      appBar: AppBar(  // Barra de arriba.
        title: Text('Titulo'), // Texto de la barra.
      ),
      body: Center( // Cuerpo de la pagina.
        child: Column( // Widget para asignar una estructura al body.
          mainAxisAlignment: MainAxisAlignment.center, //Alinea el contenido.
          children: <Widget> [ // Parte de la estructura que deja retornar otro widget.
            Text( 'Numero de taps',  style: _estiloTexto), /*Propiedad de texto.Escritura 
                                              que se muestra en pantalla con su estilo. */
            Text('$_conteo', style: _estiloTexto),
          ],
        ),
      ),
                                      // Parte de los argumentos del 'Scaffold'.   
      floatingActionButton: _crearBotones(),                         
      
    );
  }

  Widget _crearBotones () {

    return Row (
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
      FloatingActionButton(child: Icon(Icons.remove),onPressed: _sustraer),
      // SizedBox(width: 40) para hacer una sepraracion(margen),
      FloatingActionButton(child: Icon(Icons.redo),onPressed: _reset),
      FloatingActionButton(child: Icon(Icons.add),onPressed: _agregar),
      ],
    );
  }

  void _agregar () {
    setState(() {  _conteo++; });
  }
  void _sustraer () {
    setState(() {  _conteo--; });
  }
  void _reset () {
    setState(() {  _conteo = 0; });
  }




}