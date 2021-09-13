import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vertical_landing_page/providers/page_provider.dart';

import 'package:vertical_landing_page/ui/shared/custom_app_menu.dart';

import 'package:vertical_landing_page/ui/views/about_view.dart';
import 'package:vertical_landing_page/ui/views/contact_view.dart';
import 'package:vertical_landing_page/ui/views/location_view.dart';
import 'package:vertical_landing_page/ui/views/home_view.dart';
import 'package:vertical_landing_page/ui/views/pricing_view.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: buildBoxDecoration(), // Se usa este metodo para dar efecto de color 
                                  //  cuando se hace scroll y se llega a los views extremos
        child: Stack(   // Para poner elementos encimas de otros
          children: [

            // Es importante la posicion en la que se ubica el widget ya que
            // estara uno encima de otro  
            _HomeBody(),

            Positioned(
              right: 20,
              top: 20,
              child: CustomAppMenu()
            ),

          ],
        ),
      ),
    );
  }

  // Para dar efecto de color
  BoxDecoration buildBoxDecoration() => BoxDecoration(
    gradient: LinearGradient( // Da un efecto degradado al color
      colors: [  // Orden de los colores a degradar
        Colors.pink, // 1mer color
        Colors.purpleAccent // 2do color
      ],
      // Para indicar que empieze de arriba hacia abajo (vertical), esta horizontal por defecto
      begin: Alignment.topCenter,
      end  : Alignment.bottomCenter,
      // Configuracion de puntos de quiebre del gradiente, donde se quiere que inicie cada gradiente
      // 0.5 refiere a la mitad de la pantalla
      stops: [ 0.5, 0.5 ]
    )
  );
}


class _HomeBody extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    // Creacion de la instancia del Provider
    // "listen: false", porque no se necesita que se redibuje por que se tendra
    // como referencia el "scrollControler" (Provider) 
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return PageView(
      controller: pageProvider.scrollController, // Aca hacemos la referencia con Provider  
      scrollDirection: Axis.vertical,   // Para que el scroll sea vertical, por defecto lo toma horizontal
      children: [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView(),
      ],
    );
  }
}