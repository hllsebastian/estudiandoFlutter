import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/layouts/auth/widgets/background_twitter.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/links_bar.dart';

// Widget para autenticacion

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    // Variable para ayudar a definir que pantalla se mostrara
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // Para mostrar la barra de espacio hacia arriba y abajo. Para cambiar
      // el color del scrollbar, se hace desde main con la propiedad "theme" 
        body: Scrollbar( 
      // isAlwaysShown: true, // propiedad que sirve para mostrar el scrollbar
      child: ListView(
        physics: ClampingScrollPhysics(), // Para quitarle el efecto de elasticidad
                               // cuandos e hace scroll 
        children: [
          // Condidicion para definir cual pantalla se mostrara
          (size.width > 1000)
              ? _DesktopBody(child: child) // Diseño para web
              : _MobileBody(child: child), // Diseño para mobile

          // LinksBar
          LinksBar() // Texto con links en la zona inferior de la pagina
        ],
      ),
    ));
  }
}

// Diseño para mobile
class _MobileBody extends StatelessWidget {
  
  final Widget child;

  const _MobileBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          CustomTitle(),
          Container(
            width: double.infinity,
            height: 420,
            child: child, // => Es la vista
          ),
          Container(
            width: double.infinity,
            height: 400,
            child: BackgroundTwitter(),
          )
        ],
      ),
    );
  }
}

// Diseño para la web
class _DesktopBody extends StatelessWidget {
 
  final Widget child;

  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // El container de este widget debe tener un tamaño fijo que le permita ser
    // usado en el Listview para hacer scroll
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.95,
      color: Colors.red,
      child: Row(
        children: [
          // Twitter Background
          BackgroundTwitter(),

          // View Container
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(height: 20),
                CustomTitle(), // Imagen de twiter; hasta aca va el layout
                SizedBox(height: 50),
                Expanded(child: child), // Este child es el que recibira el builder
                                  // de MaterilApp en el main, el que se rendizara
              ],
            ),
          )
        ],
      ),
    );
  }
}
