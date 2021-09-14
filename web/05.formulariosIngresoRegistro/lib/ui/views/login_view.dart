import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    // Instancia para la autenticacion
    final authProvider = Provider.of<AuthProvider>(context);
    
    return ChangeNotifierProvider(
      create: ( _ ) => LoginFormProvider(),
      child: Builder(builder: ( context ){ //El Builder como child para que
      // se construya primero lo que esta antes del mismo, y luego se construira
      // lo que contiene el Builder   

        final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);


        return Container(
        margin: EdgeInsets.only(top: 100),
        padding: EdgeInsets.symmetric( horizontal: 20 ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints( maxWidth: 370 ),
            child: Form(
              // "autovalidateMode" para hacer la autovalidcion del formulario
              autovalidateMode: AutovalidateMode.always,
              // Este key permitira disparar los mensajes del "validator"
              key: loginFormProvider.formKey,
              child: Column(
                children: [
                  
                  // Email
                  TextFormField(
                    validator: ( value ) {
                      // "EmailValidator" paquete externo descargado de email_validator.
                      // ayudara a validar que el formato del email sea valido
                      if( !EmailValidator.validate(value ?? '') ) return 'Email no válido';

                      return null;
                    },
                    // El "onChanged" Se dispara cuando cambia la caja de texto. 
                    // "loginFormProvider.email" va a tener el value de la caja del texto
                    onChanged: ( value ) => loginFormProvider.email = value,
                    style: TextStyle( color: Colors.white ),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Ingrese su correo',
                      label: 'Email',
                      icon: Icons.email_outlined
                    ),
                  ),

                  SizedBox( height: 20 ),

                  // Password
                  TextFormField(
                    onChanged: ( value ) => loginFormProvider.password = value,
                    // El "validator" servira para evaluar si el campo de la contrasea
                    // cumple con las condiciones para ingresar la misma
                    validator: ( value ) {
                      if ( value == null || value.isEmpty ) return 'Ingrese su contraseña';
                      if ( value.length < 6 ) return 'La contraseña debe de ser de 6 caracteres';

                      return null; // Válido
                    },
                    obscureText: true,
                    style: TextStyle( color: Colors.white ),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: '*********',
                      label: 'Contraseña',
                      icon: Icons.lock_outline_rounded
                    ),
                  ),
                  
                  SizedBox( height: 20 ),
                  CustomOutlinedButton(
                    //  Se definio "isValid" para acceder al metodo validateForm() 
                    // del LoginFormProvider, de esta forma se evaluara si el formulario
                    // esta bien diligenciado y en tal caso se condiciona para poder tomar
                    // los datos con el "authProvider.login(loginFormProvider.email, 
                    //loginFormProvider.password)"   
                    onPressed: () {
                      final isValid = loginFormProvider.validateForm();
                      if ( isValid )
                        authProvider.login(loginFormProvider.email, loginFormProvider.password);
                    }, 
                    text: 'Ingresar',
                  ),


                  SizedBox( height: 20 ),
                  LinkText(
                    text: 'Nueva cuenta',
                    onPressed: () {
                      Navigator.pushNamed( context, Flurorouter.registerRoute );
                    },
                  )

                ],
              )
            ),
          ),
        ),
      );
      })
    );
  }

}