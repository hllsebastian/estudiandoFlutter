import 'package:flutter/material.dart';
import 'package:preferencias_usuario/widgets/menu_widget.dart';



class SettingsPage extends StatefulWidget {


  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  
  bool   _colorSecundario = false;
  int    _genero          = 1;
  String _nombre          = 'Ingrese acá nombre';

  // Para establecer un texto en el campo del "InputDecoration"
  TextEditingController? _textController;
  
  // Se va a disparar cuando se inicializa este estado, se disparara
  // antes del "build" de abajo 
  @override
  void initState() { 
    super.initState();
    _textController = TextEditingController(text: _nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      drawer: MenuWidget(),

      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('settings', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
          ),
          Divider(),

          SwitchListTile( //              switch prendido/apagdo
            value: _colorSecundario = true, 
            title: Text('Color Segundario'),
            onChanged: (value){
              setState(() {
              _colorSecundario = value;
              });
            }
          ),
                                        
          RadioListTile( //          Tap para elegir opcion con forma de punto
            value: 1, 
            title: Text('Femenino'), 
            groupValue: _genero, 
            onChanged:(value){
                _genero = value as int;
              setState(() {
                
              });

            }
          ),

          RadioListTile( //         Tap para elegir opcion con forma de punto
            value: 1, 
            title: Text('Masculino'), 
            groupValue: 2, 
            onChanged:(value){}
          ),
          Divider(),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration( // Para habilitar entrada de texto
                labelText: 'Nombre',
                helperText: 'Nombre del usuario',   
              ),
              onChanged: (value){},
            ),
          )


        ],
            
         
      ),
    );
  }
}