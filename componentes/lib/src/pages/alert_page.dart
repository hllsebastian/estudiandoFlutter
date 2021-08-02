import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar alerta'),
          onPressed: () => _mostrarAlert(context),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            shape: StadiumBorder(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  _mostrarAlert(BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: true, // para que deje salir de la opcion 
      builder: (context) {

        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: Text('Titulo del Alert'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Contenido de la caja de la alerta'),
            FlutterLogo(size: 100,)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: Text('Cancelar')
              ),
            TextButton(
              onPressed: () {Navigator.of(context).pop();
              }, 
              child: Text('Ok')
              ),
          ],
        );

      }
    );
  }

}
