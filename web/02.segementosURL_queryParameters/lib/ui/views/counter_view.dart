import 'package:flutter/material.dart';
import 'package:bases_web/ui/shared/custom_flat_button.dart';


class CounterView extends StatefulWidget {

  // Se establece esta variable para poder dibujar en pantalla el argumento
  // ingresado e la URL 
  final String base;

  const CounterView({
    Key? key, 
    required this.base
  }) : super(key: key); 

  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  
  int counter = 10;

  // Se usa para que lograr inicializarlo dentro de la clase, de lo contrario
  // no dejaria. Ademas se maneje la condicin para convertir el string en int
  @override
  void initState() { 
    super.initState();
    if ( int.tryParse(widget.base) != null ) 
      counter = int.parse(widget.base);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text('Contador Stateful', style: TextStyle( fontSize: 20 )),
        
        FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Contador: $counter',
              style: TextStyle( fontSize: 80, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFlatButton(
              text: 'Incrementar', 
              onPressed: () => setState(() => counter ++ )
            ),

            CustomFlatButton(
              text: 'Decrementar', 
              onPressed: () => setState(() => counter -- )
            ),

          ],
        ),
      ],
    );
  }
}