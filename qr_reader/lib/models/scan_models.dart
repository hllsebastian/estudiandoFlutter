// To parse this JSON data, do
//
//final scanModel = scanModelFromJson(jsonString);

import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
    ScanModel({
        this.id,
        this.tipo,
        required this.valor, // cada que se crea una instancia del ScanModel, 
                            // tiene que venir  este valor
     }) {

    if (this.valor.contains('http')){
      this.tipo = 'htttp';
    } else {
      this.tipo = 'geo';
    }}


    int? id;
    String? tipo;
    String valor;

    LatLng getLatLng() {

      //listado para que primero se la latitud y luego la longitud
      final latLng = this.valor.substring(4).split(',');
      final lat = double.parse( latLng[0] );
      final lng = double.parse( latLng[1] );

      return LatLng( lat, lng );
    }

    //Cuando recibe un Json va a crear una nueva instancia de la clase 
    //ScanModel
    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id   : json["id"],
        tipo : json["tipo"],
        valor: json["valor"],
    );

    //Tomara la instancia de la clase ScanModel y lo pasara a un nuevo 
    //mapa, con el cual se trabajar en SQFLite
    Map<String, dynamic> toJson() => {
        "id"   : id,
        "tipo" : tipo,
        "valor": valor,
    };
}
