/* import 'package:bases_web/ui/shared/custom_app_menu.dart';
import 'package:bases_web/ui/shared/custom_flat_buttom.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  
  int counter = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          CustomAppMenu(),
          
          Spacer(),

          Text('Counter Stateful'),

          FittedBox( // Para que el contenido mostrado en pantalla se ajuste
                     // al tamaaño de la pagina
            fit: BoxFit.contain,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Contador: $counter',
                style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Para alinear el
                          // los bontones dentro del espacio asignado para este
                          // widget 
            children: [
              CustomFlatButtom(  
                text     : 'Incrementar', 
                onPressed: ()=> setState(() => counter++)
              ),

              CustomFlatButtom(
                text     : 'Decrementar', 
                onPressed: () => setState(() => counter--)
              ),              
            ],
          ),

          Spacer(),
        ],
      ),
    );
  }
}
 */