/* import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bases_web/providers/counter_provider.dart';
import 'package:bases_web/ui/shared/custom_app_menu.dart';
import 'package:bases_web/ui/shared/custom_flat_buttom.dart';

class CounterProviderPage extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider ( 
      create: (_) => CounterProvider(), // Se consumiran los metodos de esta clase
      child: _CounterProviderPageBody());
  }
}

class _CounterProviderPageBody extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    // Se define una instancia con la cual consumir el Provider
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(  // Este widget se extrajo del "CounterProviderPage" y
          // se nombro como "_CounterProviderPageBody()", para  luego envolverlo  
          // en un "ChangeNotifierProvider", en el que se crea la instancia
          // de la clase "CounterProvider()" con la finalidad de consumir sus
          // metodos y asi redibujar las propiedades
          // 

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          CustomAppMenu(),
          
          Spacer(),

          Text('Counter Provider', style: TextStyle(fontSize: 20),),

          FittedBox( // Para que el contenido mostrado en pantalla se ajuste
                     // al tamaaño de la pagina
            fit: BoxFit.contain,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Contador: ${counterProvider.counter}', // Consumiento Provider
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
                onPressed: ()=> counterProvider.increment() // Consumiento Provider
              ),

              CustomFlatButtom(
                text     : 'Decrementar', 
                onPressed: () => counterProvider.decrement() // Consumiento Provider
              ),
            ],
          ),

          Spacer(),
        ],
      ),
    );
  }
} */