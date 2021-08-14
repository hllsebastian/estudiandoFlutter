import 'package:flutter/material.dart';
import 'package:qr_reader/pages/direcciones_page.dart';

import 'package:qr_reader/widgets/custom_navigatorBar.dart';
import 'package:qr_reader/pages/mapas_page.dart';
import 'package:qr_reader/widgets/scan_button.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.delete_forever)
          )
      ]),
      
      body: _HomePageBody(),

      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,

    

   );
  }
}


class _HomePageBody extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    
    // Condicion que se usara para mostrar la pagina
    final currentIndex = 0;

    switch(currentIndex) {

      case 0: 
        return MapasPage();
      
      case 1: 
        return DireccionesPage();

      default: 
        return MapasPage();
    }

  }
}