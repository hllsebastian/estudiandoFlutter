import 'package:bases_web/services/navigator_service.dart';
import 'package:bases_web/ui/shared/custom_flat_buttom.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';

class CustomAppMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
   /*  print('appBar Creado'); // Para demostrar que cuando se da click para
                // navegar entre paginas o usar el contador, se reconstruye
                // toda la pagina y no solo el area que se tiene dispuesta para
                // ver el contenido de la pagina    */

    // "LayoutBuilder()" perite usar  el "builder: " donde se usa el context
    //  "constraints". Los "constraints" nos ayudan a definir las propiedades
    // del tamañao de la pantalla  "constraints.maxWidth"
    return LayoutBuilder( 
      builder: (_, constraints) => (constraints.maxWidth > 520) 
      ? _TableDesktopMenu()
      : _MobileMenu()
    );
  }
}

                                            // Menu para Desktop
class _TableDesktopMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Row(
        children: [
          CustomFlatButtom(
              text: 'Contador Stateful',
              
              // RECORDAR: Se usaron diferentes formas para navegar: la tradicionarl, con GlobalKey
              // y el paquete GetIt, esta ultima es la que se establecio al final 
              
              //onPressed: () => Navigator.pushNamed(context, '/stateful'), // Navegacion tradicional
              
              // Aca se establece la navegacion usando el "locator" definido con el paquete GetIt
              onPressed: () => locator<NavigationService>().navigateTo('/stateful'), // Navegacion con GlobalKey
          
              color: Colors.black
          ),
          SizedBox(
            width: 10,
          ), // Ayuda a la separacion de los botones

          CustomFlatButtom(
              text: 'Contador Provider',
              //onPressed: () => Navigator.pushNamed(context, '/provider'),
              onPressed: () => locator<NavigationService>().navigateTo('/provider'),
              color: Colors.black),
          SizedBox(
            width: 10,
          ),

          CustomFlatButtom(
              text: 'Nueva pagina',
              //onPressed: () => Navigator.pushNamed(context, '/404'),
              onPressed: () => locator<NavigationService>().navigateTo('/ABC123'),
              color: Colors.black),
        ],
      ),
    );
  }
}


                                          // Menu para mobile 
// Este widget sera usado cuando las dimensiones sean inferiores de 520px.
class _MobileMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Column( // Para cambiar la estructura del menu 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFlatButtom(
              text: 'Contador Stateful',
              
              // RECORDAR: Se usaron diferentes formas para navegar: la tradicionarl, con GlobalKey
              // y el paquete GetIt, esta ultima es la que se establecio al final 
              
              //onPressed: () => Navigator.pushNamed(context, '/stateful'), // Navegacion tradicional
              
              // Aca se establece la navegacion usando el "locator" definido con el paquete GetIt
              onPressed: () => locator<NavigationService>().navigateTo('/stateful'), // Navegacion con GlobalKey
          
              color: Colors.black
          ),
          SizedBox(
            width: 10,
          ), // Ayuda a la separacion de los botones

          CustomFlatButtom(
              text: 'Contador Provider',
              //onPressed: () => Navigator.pushNamed(context, '/provider'),
              onPressed: () => locator<NavigationService>().navigateTo('/provider'),
              color: Colors.black),
          SizedBox(
            width: 10,
          ),

          CustomFlatButtom(
              text: 'Nueva pagina',
              //onPressed: () => Navigator.pushNamed(context, '/404'),
              onPressed: () => locator<NavigationService>().navigateTo('/ABC123'),
              color: Colors.black),
        ],
      ),
    );
  }
}
