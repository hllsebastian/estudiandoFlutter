import 'package:flutter/material.dart';
// Paquete para escanear con la camara, debe descargarse antes
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.filter_center_focus),
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                                    '#f32c10', 
                                                    'cancelar', 
                                                    false, 
                                                    ScanMode.QR);
      

          //final barcodeScanRes = 'https://fernando-herrera.com';
          //final barcodeScanRes = 'geo:6.284037,-75.524710';

          if (barcodeScanRes == '-1') {
            return;
          }

          // El "Provider" redibujara todo el tipo "ScanListProvider"
          final scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);

          final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

          launchURL(context, nuevoScan);
        });
  }
}
