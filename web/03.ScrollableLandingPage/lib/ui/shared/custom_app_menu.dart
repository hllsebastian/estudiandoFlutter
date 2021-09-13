import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';
import 'package:vertical_landing_page/ui/shared/custom_menu_item.dart';


// Menu de la pagina, es un menu que al dar click el icono cambia
// desplegando las opciones, por esto se definio como Stateful
class CustomAppMenu extends StatefulWidget {
  @override
  _CustomAppMenuState createState() => _CustomAppMenuState();
}

// Se mezcla la clase con un "SingleTickerProviderStateMixin" para poder
// llamar el  "vsync" cuando se esta inicializando el estado
class _CustomAppMenuState extends State<CustomAppMenu> with SingleTickerProviderStateMixin {

  // Definiendo la variable para desplegar el menu
  bool isOpen = false;
  // Definiendo la variable tipo AnimationController que ayuda a generar un icono animado
  late AnimationController controller;

  @override
  void initState() { 
    super.initState();
    
    // "vsync" -> vertical sync, para sincronizar el AnimationController con el
    // widger y el estado 
    controller = AnimationController(vsync: this, duration: Duration( milliseconds: 200 ));
  }

  @override
  Widget build(BuildContext context) {

    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return MouseRegion( // Detecta el cursor del mouse
      cursor: SystemMouseCursors.click, // Cuando el cursor esta sobre un area a seleccionar, cambia el icono
      child: GestureDetector(  // Para dectectar cuando se da click
        onTap: (){ 
          
          // Aca se define la condicion para hacer la animacion cuando se
          // selecciona el menu de opciones 

          if ( isOpen ) {
            controller.reverse();
          } else {
            controller.forward();
          }

          setState(() {
            isOpen = !isOpen;
          });

        },
        child: Container(
          padding: EdgeInsets.symmetric( horizontal: 10 ),
          width: 150,
          height: isOpen ? 308: 50,  // Se hizo una condicion para aumentar el tamaño  
                              // del menu cuando el cursor este sobre él 
          color: Colors.black,
          child: Column(
            children: [ // Aca se formo el menu junto con sus opciones
              _MenuTitle(isOpen: isOpen, controller: controller),

              // El "delay" es un parametro para darle un tiempo de carga a la opcion, asi 
              // se dara una animacion que el menu se abre de arria para abajo de acuerdo al
              // orden de cada opcion 

              // "pageProvider.goTo" para que haga la navegacion a la vista seleccionada
              
              if ( isOpen ) // Solo se mostrara el menu cuando el cursor este sobre dicha opcion
                ...[
                  CustomMenuItem( delay: 0, text: 'Home', onPressed: () => pageProvider.goTo(0)),
                  CustomMenuItem( delay: 30, text: 'About', onPressed: () => pageProvider.goTo(1)),
                  CustomMenuItem( delay: 60, text: 'Pricing', onPressed: () => pageProvider.goTo(2)),
                  CustomMenuItem( delay: 90, text: 'Contact', onPressed: () => pageProvider.goTo(3)),
                  CustomMenuItem( delay: 120, text: 'Location', onPressed: () => pageProvider.goTo(4)),
                  SizedBox( height: 8 ) // Para separa la ultima opcion del borde
                ]
            ],
          ),
        ),
      ),
    );
  }
}



// widget donde se creo el espacio para el menu de opciones
class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  
  final bool isOpen;
  // El "AnimationController" ayuda a generar un icono animado
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer( // Aca se defin la animacion del "AnimatedContainer"
            duration: Duration( milliseconds: 200 ),
            curve: Curves.easeInOut,
            width: isOpen ? 45 : 0,
          ),
          Text('Menú', style: GoogleFonts.roboto( color: Colors.white, fontSize: 18 )),
          Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller, 
            color: Colors.white,
          )
        ],
      ),
    );
  }
}