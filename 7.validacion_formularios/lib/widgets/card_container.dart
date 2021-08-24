import 'package:flutter/material.dart';


// Aca se le dio forma al Widget "CardContainer", que sera llamado en 
// la pantalla "login_screen"

class CardContainer extends StatelessWidget {

  final Widget child;

  const CardContainer({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric( horizontal: 30 ), // para dar separacion a 
                                          // los bordes
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.all( 20 ),
          decoration: _createCardShape(),
          child: this.child,
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25), // Para darle efecto redondo a las
                                        // esquinas de los bordes
    boxShadow: [ // para dar efecto de sombra
      BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0, 5),
      )
    ]
  );
}