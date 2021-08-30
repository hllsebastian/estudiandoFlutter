import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mapbox_gl/mapbox_gl.dart';


class FullScreenMap extends StatefulWidget {

  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {

  MapboxMapController mapController;
  
  // Ubicacion indicada para mostrar
  final center = LatLng(37.810575, -122.477174);
  // Estilo seleccionado para mostrar 
  String selectedStyle = 'mapbox://styles/hllsebastian/cksz31lt90ygz17nr3sx61khc';

  // Estilos definidos desde la web de MapBox 
  final oscuroStyle = 'mapbox://styles/hllsebastian/cksz31lt90ygz17nr3sx61khc';
  final streetStyle = 'mapbox://styles/hllsebastian/cksz3d03q0yri17nrvkknnxss';


  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    _onStyleLoaded();
  }

  // Copiados del gitHub de Maps
  void _onStyleLoaded() {
    // Para Coger imagenes de la carpeta Assets
    addImageFromAsset("assetImage", "assets/custom-icon.png");
    // Para Coger imagenes de una URL
    addImageFromUrl("networkImage", "https://via.placeholder.com/50");
  }

  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    // "ByteData" y "Uint8List", son del paquete typed_data
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return mapController.addImage(name, list);
  }

  /// Adds a network image to the currently displayed style
  Future<void> addImageFromUrl(String name, String url) async {
    //  El "get" es del paquete HTTP
    var response = await http.get(url);
    return mapController.addImage(name, response.bodyBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: crearMapa(),
      floatingActionButton: botonesFlotantes(),
    );
  }

  // En este metodo se agregaron los botones 
  Column botonesFlotantes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[

        // Símbolos
        FloatingActionButton(
          child: Icon( Icons.sentiment_very_dissatisfied ),
          onPressed: () {
            
            // Para adicionar un simbolo al Map
            mapController.addSymbol( SymbolOptions(

              geometry: center, // Esto es la latitud y longitud
              iconSize: 1,
              // textColor:,// Dar color al texto
              iconImage: 'volcano-15', // tomada del gitHub de MapBox
              textField: 'Montaña creada aquí',
              textOffset: Offset(0, 2) // Cambia la posicion del texto
            ));

          }
        ),

        SizedBox( height: 5 ),

        // ZoomIn
        FloatingActionButton(
          child: Icon( Icons.zoom_in ),
          onPressed: () {
            // instancia que permite controlar las propiedades del MapBox
            mapController.animateCamera( CameraUpdate.zoomIn() );
          }
        ),

        SizedBox( height: 5 ),

        // ZoomOut
        FloatingActionButton(
          child: Icon( Icons.zoom_out),
          onPressed: () {
            mapController.animateCamera( CameraUpdate.zoomOut() );
          }
        ),

        SizedBox( height: 5 ),


        // Cambiar Estilos
        FloatingActionButton(
          child: Icon( Icons.add_to_home_screen),
          onPressed: (){ 

            if ( selectedStyle == oscuroStyle ) {
              selectedStyle = streetStyle;
            } else {
              selectedStyle = oscuroStyle;
            }
            _onStyleLoaded();
            setState(() {});
          }
        )
      ],
    );
  }

  // Para crear el mapa
  MapboxMap crearMapa() {
    return MapboxMap(
      styleString: selectedStyle,
      onMapCreated: _onMapCreated,
      initialCameraPosition:
        CameraPosition(
          target: center,
          zoom: 14
        ),
      );
  }
}