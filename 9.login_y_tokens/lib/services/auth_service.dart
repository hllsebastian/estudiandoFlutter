import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

// Aca se hace la peticion HTTP para crear cuenta

class AuthService extends ChangeNotifier {

  // obtenido del GET que se hizo en postman con la API key de firebase
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  // token de acceso al API de Firebase
  final String _firebaseToken = 'AIzaSyBcytoCbDUARrX8eHpcR-Bdrdq0yUmSjf8';
  // para hacer un almacenamiento que permita tener iniciado la sesion,
  // se importa el paquete  flutter_secure_storage.dart
  final storage = new FlutterSecureStorage();


  // PROCESO PARA REGISTAR USUARIO
  // Si retornamos algo, es un error, si no, todo bien!
  Future<String?> createUser( String email, String password ) async {

    // estructura de los datos que se van a enviar
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      // manera segura de retornar un toquen
      // y que Firebase sabe quen alguien se autentico segun las reglas
      // especificadas 
      'returnSecureToken': true
    };

    // unenCodePath es lo que esta antes del key en el endoint del APIkey
    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {
      'key': _firebaseToken
    });

    // pasando a Json lo que se va a enviar "authData"
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode( resp.body );


    if ( decodedResp.containsKey('idToken') ) {
        // Token hay que guardarlo en un lugar seguro.
        // Para guardar el token
        await storage.write(key: 'token', value: decodedResp['idToken']);
        // decodedResp['idToken'];
        return null;
    } else {
      // Se tomo el error que envia Firebase en consola
      return decodedResp['error']['message'];
    }

  }

  // PROCESO PARA LOGIN USUARIO
  // basicamente lo mismo del registro, solo cambia parte del endpoint  
    Future<String?> login( String email, String password ) async {

    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key': _firebaseToken
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode( resp.body );

    // condiciones para ingreso de usuario
    if ( decodedResp.containsKey('idToken') ) {
        // Token hay que guardarlo en un lugar seguro
        // decodedResp['idToken'];
        await storage.write(key: 'token', value: decodedResp['idToken']);
        return null;
    } else {
      return decodedResp['error']['message'];
    }

  }

  // CIERRE DE SESION
  Future logout() async {
    // borrar el token
    await storage.delete(key: 'token');
    return;
  }

  // VERIFICAION DEL TOKEN
  Future<String> readToken() async {
  
    return await storage.read(key: 'token') ?? '';

  }



}