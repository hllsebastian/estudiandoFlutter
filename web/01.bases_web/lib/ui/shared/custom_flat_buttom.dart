import 'package:flutter/material.dart';


// La finalidad de este widget es reutilizarlo, por tanto se definen unas 
// propiedades y un constructor para estas 

class CustomFlatButtom extends StatelessWidget {

  final String   text;
  final Color    color;
  final Function onPressed;

  const CustomFlatButtom({
    Key? key, 
    required this.text, 
    required this.onPressed,
    this.color = Colors.pink 
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextButton(
      style  : TextButton.styleFrom( // para darle color al boton
      primary: color
      ), 
      onPressed: ( )=> onPressed(),
      child    : Padding(  // Para darle margen al texto dentro del boton, lo que
                       // es separar el texto del borde del boton
        padding: const EdgeInsets.all(10),
        child  : Text(text)
      )
    );
  }
}
