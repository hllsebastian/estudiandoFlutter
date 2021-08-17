import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/models/scan_models.dart';
import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/ui_provides.dart';

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


    //Obteniendo el "selectedMenuOpt", que redibujara la app
    //debe inidcarse que es de tipo "Uiprovider" 
    final uiProvider = Provider.of<UiProvider>(context);

    // Condicion que se usara para mostrar la pagina
    final currentIndex = uiProvider.selectedMenuOpt;

     // TODO: leer temporalmente la ruta de la BD

    //final tempScan =  ScanModel(valor: 'http://google.com');
    //DBProvider.db.nuevoScan(tempScan); // para llamar el ingreso de registro

    DBProvider.db.getTodosLosScans(16).then((scan) => print (scan));
    


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