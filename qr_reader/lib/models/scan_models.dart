// To parse this JSON data, do
//
//final scanModel = scanModelFromJson(jsonString);

import 'dart:convert';

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

    //Cuando recibe un Json va a crear una nueva instancia de la clase 
    //ScanModel
    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    //Tomara la instancia de la clase ScanModel y lo pasara a un nuevo 
    //mapa, con el cual se trabajar en SQFLite
    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };
}
