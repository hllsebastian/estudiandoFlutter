import 'package:flutter/material.dart';

import 'package:componentes/src/utils/icons_string_utils.dart';

import 'menu_provider.dart';



class HomePage  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }


  Widget _lista() {

    return FutureBuilder(

      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot <List<dynamic>> snapshot) {

      
        return ListView(
        children: _listaItems(snapshot.data, context),
        );  
      }
    );
  }

  List<Widget> _listaItems(List<dynamic>? data, BuildContext context) {
     
    final List<Widget> opciones = [];
    data?.forEach((opt) {  

      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']), // se agrego funcion para obtener un icon   
        trailing: Icon(Icons.chevron_right, color: Colors.amber),
        onTap: () {

///                      para acceder a una coleccion de rutas dentro de un mapa
///                      definido en el main
          Navigator.pushNamed(context, opt['ruta']); 


        /*// creando la ruta para ir a una paginas, tambien deben ser importadas
            final route = MaterialPageRoute(
              builder: (context) {
                return AlertPage();
              } 
          );

          Navigator.push(context, route); ///objeto "Navigator" y metodo ".push"
                                /// para hacer la navegacion entre las opciones */
        },  
      );
    
      opciones..add(widgetTemp)
              ..add(Divider());

    });

    return opciones;

  }


}