import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';


// Aca se defio el scaffol del dashboard

class DashboardLayout extends StatefulWidget {

  final Widget child;

  const DashboardLayout({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  _DashboardLayoutState createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> with SingleTickerProviderStateMixin {


  @override
  void initState() { 
    super.initState();
    
    // Para usar el "vsync" debe mezclarse la estencion del State con "SingleTickerProviderStateMixin" 
    SideMenuProvider.menuController = new AnimationController(
      vsync: this,  
      duration: Duration(milliseconds: 300) // Duracion de la animacion
    );

  }


  @override
  Widget build(BuildContext context) {

    // Para trabajar los tamaños de la pantalla
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color( 0xffEDF1F2 ),
      body: Stack(
        children: [
          Row(
            children: [
              
              if ( size.width >= 700 )
                Sidebar(),

              Expanded(
                child: Column(
                  children: [
                    // Navbar
                    Navbar(),

                    // View 
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
                        child: widget.child,
                      )
                    ),
                  ],
                ),
              )
              // Contenedor de nuestro view
            ],
          ),


          if( size.width < 700 ) // Para construir la animacion cuando el tamaño de la 
                                 // pantalla es inferior a 700px
            AnimatedBuilder( 
              animation: SideMenuProvider.menuController, // La instancia del Provider para redibujar  
              builder: ( context, _ ) => Stack( // El widget a construir
                children: [

                  // Cuando se abra el menu animado, se dibujara el menu del "Container" y cuando se 
                  // de click sobre el espcio de este Container, se cerrara el menu 
                  if( SideMenuProvider.isOpen )
                    Opacity(
                      // Otra forma de hacerlo es con el "AnimatedOpacity"
                      opacity: SideMenuProvider.opacity.value, // El metodo opacity del Provider
                      child: GestureDetector( // Detectando la accion del cursor
                        onTap: () => SideMenuProvider.closeMenu(), // Cerrando el menuAnimado con click
                        child: Container( // El container que se creara cuando se abra el menuAnimado
                          width: size.width,
                          height: size.height,
                          color: Colors.black26,
                        ),
                      ),
                    ),


                  Transform.translate( // Para usar el "offset" y moverlo en las coordenadas "x" y "y"                                      
                    offset: Offset( SideMenuProvider.movement.value, 0 ),
                    child: Sidebar(),
                  )
                ],
              )) 
        ],
      )
    );
  }
}