import 'package:flutter/material.dart';
// Paquete para escanear con la camara, debe descargarse antes 
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async{

        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                                    '#f32c10', 
                                                    'cancelar', 
                                                    false, 
                                                    ScanMode.QR);
        print(barcodeScanRes);                                                    
      }
    );
  }
}


