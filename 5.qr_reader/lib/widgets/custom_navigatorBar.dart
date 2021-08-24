import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/ui_provides.dart';




class CustomNavigatorBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      // Capta el tap para cambiar la propiedad del "selectedMenuOpt"
      // y mostrar la pagina segun donde se dio tap
      onTap: (int i)=> uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex, // Para indicar cual boton se deja seleccionado
      elevation: 0, // Quita la raya que viene por defecto
      items: [
        
        BottomNavigationBarItem(
          // Para mostrar coordenadas
          icon : Icon(Icons.map),
          label: 'Mapa',
        ),
       
        BottomNavigationBarItem(
          // Para mostrar direcciones
          icon : Icon(Icons.compass_calibration),
          label: 'Direcciones',
        ),
      ]
    
    );
  }
}


