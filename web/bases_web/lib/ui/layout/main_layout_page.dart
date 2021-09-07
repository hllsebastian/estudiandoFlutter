import 'package:bases_web/ui/shared/custom_app_menu.dart';
import 'package:flutter/material.dart';

// Aca definimos el widget que permitira definir la pagina; posteriormente
// se crearon las views, que sera solo el espacion que cambiara en pantalla,
// es decir, solo cambiara el contenido de la pagina (contaddor) y no el menu  
//
// layout = tiene Scaffold
// View   = no tiene Scaffold, depende de uno

class MainLayoutPage extends StatelessWidget {

  // Se crea esta propiedad para llamarla en el constructor de rutas en el main
  final Widget child;

  const MainLayoutPage({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          CustomAppMenu(),  
          Spacer(),
          Expanded(child: child),
          Spacer(),
        ],
      )),
    );
  }
}
