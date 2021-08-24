import 'package:flutter/material.dart';
import 'package:productos_app/providers/login_form_provider.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView( // Permite hacer scroll si los hijos
                          // sobrepasan el tamaño de su area
          child: Column(
            children: [

              SizedBox( height: 250 ), // Para bajar el area del "CardContainer"

              CardContainer( // Widget para contener el ingreso de los datos
                child: Column(
                  children: [

                    SizedBox( height: 10 ), // Para hacer una separacion
                    Text('Login', style: Theme.of(context).textTheme.headline4 ),
                    SizedBox( height: 30 ),
                    
                    // LLamado del widget "LoginFormProvider()", donde se
                    // definio el formulario para el ingreso del correo y
                    // contraseña. Esta dentro de la carpeta "providers"
                    // donde se creo el gestor de estado para redibujar solo
                    // esta parte de la app.
                    //
                    // Aca envolvemos en un "ChangeNotifierProvider" la Clase
                    // que tiene la logica para ejecutar el cambio.
                    //
                    // Solo que esta dentro de "_LoginForm" tendra acceso a 
                    // "LoginFormProvider"
                    ChangeNotifierProvider(
                      create: ( _ ) => LoginFormProvider(),
                      child: _LoginForm()
                    )
                    

                  ],
                )
              ),

              // Aca se asigno el area para ingresar un texto descriptivo
              // de la pantallana  
              SizedBox( height: 50 ), 
              Text('Crear una nueva cuenta', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ),),
              SizedBox( height: 50 ),
            ],
          ),
        )
      )
   );
  }
}


class _LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    // Para dar Acceso a este Widget a todo lo que la clase "Login_form_provider"
    // ofrece. 
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formKey, // Referencia el acceso a la clase
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Column(
          children: [
            
            // CAMPO PARA EL CORREO
            // EL "TextFormField" habilita un campo y el teclado en pantalla 
            // para ingresar datos
            TextFormField( 
              autocorrect: false, // Para quitar la autocorreccion
              keyboardType: TextInputType.emailAddress, // Para ingresar el
                                      //teclado con el "@"
              decoration: InputDecorations.authInputDecoration( // Se llama 
              // a la clase con su metodo "InputDecorations.authInputDecoration"
                hintText: 'john.doe@gmail.com', // Cuando se da tap en el campo
                // se observa este texto a modo de ejemplo del formato que se 
                // debe ingresar en el campo
                labelText: 'Correo electrónico', // Antes de dar tap en el campo,
                // muestra este texto para indicar que se debe ingresar 
                prefixIcon: Icons.alternate_email_rounded
              ),
              onChanged: ( value ) => loginForm.email = value,
             
              // Para mostrar un mensaje que indica si los datos son validos o
              // invalidos 
              validator: ( value ) {
                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp  = new RegExp(pattern);
                  
                  return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no luce como un correo';

              },
            ),

            SizedBox( height: 30 ),

            // CAMPO PARA LA CONTRASEÑA
            // EL "TextFormField" habilita un campo y el teclado en pantalla 
            // para ingresar datos
            TextFormField(
              autocorrect: false,
              obscureText: true, // Para no ver el texto que se esta escribiendo
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline
              ),
              onChanged: ( value ) => loginForm.password = value,
           
              // Para mostrar un mensaje que indica si los datos son validos o
              // invalidos 
              validator: ( value ) {

                  return ( value != null && value.length >= 6 ) 
                    ? null
                    : 'La contraseña debe de ser de 6 caracteres';                                    
              },
            ),

            SizedBox( height: 30 ),


            // Creacion del boton "Ingresar"
            MaterialButton(
              // Borde del boton
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container( // personalizacion del texto
                padding: EdgeInsets.symmetric( horizontal: 80, vertical: 15),
                child: Text(
                  loginForm.isLoading // En todo este widget tenemos acceso al 
                                // "loginform"
                    ? 'Espere'
                    : 'Ingresar',
                  style: TextStyle( color: Colors.white ),
                )
              ),

              // Se establecd que si esta cargando se deshabilite el boton
              // cambiando el "onPressed" a "null".  
              onPressed: loginForm.isLoading ? null : () async {
                
                // Para quitar el teclado luego del "onPressed" (presionar boton)
                FocusScope.of(context).unfocus();
                
                if( !loginForm.isValidForm() ) return;

                loginForm.isLoading = true;

                //espera mientras se procesa el ingreso de datos
                await Future.delayed(Duration(seconds: 2 ));

                // TODO: validar si el login es correcto
                loginForm.isLoading = false;

                // Cuando se ingresan los datos de forma correcta ingresa
                //al home con esta instruccion 
                Navigator.pushReplacementNamed(context, 'home');
              }
            )

          ],
        ),
      ),
    );
  }
}