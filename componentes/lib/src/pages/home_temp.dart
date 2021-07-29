import 'package:flutter/material.dart'; // "impom" sniper


class HomePageTemp extends StatelessWidget {

  final opciones = ['1', '2', '2', '3', '4', '5', '6'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('Componentes Temp',      
        ),
      ),
      body: ListView(
        //children: _crearItems()
        children: _crearItems()
      ),
    );
  }

  List<Widget> _crearItems () {

    List<Widget> lista =  [];

    for (String opt in opciones) {
      
      final tempWidget = ListTile(
        title: Text(opt),
      );

        lista..add(tempWidget);        
        lista.add(Divider(
          height: 20,
          color: Colors.amber));
    }

    return lista;
  } 

  // usando el metodo map que viene en todas las listas

 /*  List<Widget> _crearItemsCorto(){

    return  opciones.map((item) {

      return Column(
        children:<Widget> [
          ListTile(
            title   : Text(item + '!!'),
            subtitle: Text('Cosa'),
            leading : Icon(Icons.account_circle),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          Divider(),
        ],
      );
      
    }
    ).toList();

  
  } */


}


