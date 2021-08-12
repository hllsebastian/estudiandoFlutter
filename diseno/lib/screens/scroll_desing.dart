import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class ScrollDesign extends StatelessWidget {

   final boxDecoration = BoxDecoration( 
          gradient: LinearGradient(
            begin : Alignment.topCenter,
            end   : Alignment.bottomCenter,
            stops : [0.5, 0.5],
            colors: [
              Color(0xff5EE8C5),
              Color(0xff30BAD6),  
            ]
          )
  );

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(   
      body: Container( // se hizo un container como tecnica para dar una gradiente de color en el fondo
            // y asi cuando el scroll llegue a su maximo arriba o abajo, el efecto conserve el color
            //de la imagen y no el color por defecto (blanco)
        
        decoration: boxDecoration,
        
        child: PageView(
          physics: BouncingScrollPhysics(), // da efecto de movilidad cuando llega al maximo de scroll
          scrollDirection: Axis.vertical, 

          children:[
             Page1(),
             Page2(),
          ],
        ),
      ),
   );
  }
}

class Page1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background
       Background(),
       // Main content
       MainContent()
      ],
    );
  }
}


class MainContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    // personalizacion del texto con "fontSize" = tamaño de la fuente
    // "fontWeight.bold" = negrita 
    var textStyle = TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white);
    
    return SafeArea( // ayudo a que el texto no se saliera de la pantalla
      
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
        SizedBox(height: 40),
        Text('11°C', style: textStyle),
        Text('Miercoles', style: textStyle),
        Expanded(child: Container()),
        Icon(Icons.keyboard_arrow_down_rounded, size: 100, color: Colors.white)
        ]
      ),
    );
  }
}

class Background extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
     color    : Color(0xff30BAD6),
     height   : double.infinity, // se esta indicando que el container tome todo el espacio posible
     alignment: Alignment.topCenter, // para que el contenido del contenedor centrado
     child    : Image(image: AssetImage('assets/scroll-1.png'))
      
    );
  }
}

class Page2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff30BAD6),
      child: Center(

        child: TextButton(
          
          style  : TextButton.styleFrom( //personalizar el boton
            shape: StadiumBorder(), // cambia los bordes del boton
            backgroundColor: Color(0xff0098FA)// para cambiar el color de fondo del boton
          ),
          
          onPressed: (){},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child  : Text('Bienvenid@', style: TextStyle (fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white) )),
          
        ),
      ),
     );
  }
}

















