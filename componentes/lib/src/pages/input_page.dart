import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPage createState() => _InputPage();
}

class _InputPage extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  // esta variable se define para guardar la fecha elegida en el campo
  TextEditingController _inputDateController = TextEditingController();

  String _opcionSeleccionada = 'volar'; // opcion que aparecere por defecto
  List<String> _poderes = [
    'volar',
    'rayos laser',
    'super aliento',
    'super fuerza'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPersona(),
          Divider(),
          _crearPasword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
        ],
      ),
    );
  }

  _crearInput() {
    //"TextField" para una linea, "TextFieldFormField" para un formulario
    return TextField(
      autofocus: true, //despliega automaticamente el texto
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        counter: Text('Letras: ${_nombre.length} '),
        labelText: 'Nombre', //titulo del campo
        hintText: 'Escriba acá el nombre', // fondo del campo
        helperText: 'Solo escriba letras', // letra auxiliar
        suffixIcon: Icon(Icons.person), // icono dentro del campo
        icon: Icon(Icons.person_add), // icono afuera del campo
      ),

      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  _crearEmail() {
    return TextField(
      autofocus: true, //despliega automaticamente el texto
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: 'e-mail', //titulo del campo
        hintText: 'Escriba acá el e-mail', // fondo del campo
        icon: Icon(Icons.email), // icono afuera del campo
        suffixIcon: Icon(Icons.alternate_email), // icono dentro del campo
      ),

      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  _crearPasword() {
    return TextField(
      autofocus: true, //despliega automaticamente el texto
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: 'Password', //titulo del campo
        hintText: 'Escriba acá su password', // fondo del campo
        icon: Icon(Icons.lock), // icono afuera del campo
        suffixIcon: Icon(Icons.password_outlined), // icono dentro del campo
      ),
    );
  }

  _crearFecha(BuildContext contex) {
    return TextField(
      autofocus: true, //despliega automaticamente el texto
      enableInteractiveSelection: false, // para no permitir que escriba
      controller: _inputDateController, // para que deje guardado en el campo
      // la seleccion de la fecha
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelText: 'Fecha de nacimiento', //titulo del campo
          hintText: 'Ingrese acá la fecha de nacimiento', // fondo del campo
          icon: Icon(Icons.calendar_today), // icono afuera del campo
          suffixIcon:
              Icon(Icons.perm_contact_calendar) // icono dentro del campo
          ),
      onTap: () {
        // para quitar la iluminacion cuando se selecciona el campo
        FocusScope.of(context).requestFocus(new FocusNode());
        // metodo que se crea para definir la seleccion de la fecha
        _selectDate(context);
      },
    );
  }

  // se definio la seleccion de la fecha
  _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      // Permite asignar calendario...
      context: context, // Se usa como future para que espere la eleccion
      initialDate: DateTime.now(), // de fecha y muestre la fecha elegida y no
      firstDate: DateTime(2019), // la instancia
      lastDate: DateTime(2022),
      locale: Locale('es', 'ES'), // para establecer idioma al calendario
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputDateController.text = _fecha;
      });
    }
  }

  _crearPersona() {
    // Para mostrar el nombre que se escriba, mientras se escribe
    return ListTile(
      title: Text('Su nombre es $_nombre'),
      subtitle: Text('email: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }

  List<DropdownMenuItem<String>>? getOpcionesDropDown() {
    List<DropdownMenuItem<String>> lista = [];

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  _crearDropdown() {
    // Para crear un listado
    return Row ( 
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30),
        Expanded(
          child: DropdownButton(
                value: _opcionSeleccionada,
                items: getOpcionesDropDown(),
                onChanged: (opt) {
                  setState(() {
                    _opcionSeleccionada = opt.toString();
                  });
                },
              ),
        ),
      ],
    ); 

    
    
    
    
  }
}
