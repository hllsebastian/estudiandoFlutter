import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';


// Widge para optimizar el codigo
class ScanTiles extends StatelessWidget {


  final tipo;
  const ScanTiles({ required this.tipo});
  

  @override
  Widget build(BuildContext context) {
    
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount  : scanListProvider.scans.length,
      itemBuilder: (_, i) => Dismissible( // Se borrar moviendo el recuadro 
        key: UniqueKey(), // hacia una lado. El "backgorund" ayudara a 
        background: Container( // personalizar el color del espacio que deja
            color: Colors.black12 // mientras se elimina
        ),
        // "onDismissed" ayuda a llamar una funcion "DismmissDirection"
        onDismissed: (DismissDirection direction ) {
          Provider.of<ScanListProvider>(context, listen: false).borrarScanPorId(scans[i].id!);
        },


        child: ListTile(
          leading : Icon(
            this.tipo == 'http' 
            ? Icons.home_outlined
            : Icons.map_outlined,  
            
            
          ),
          title   : Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.red),
          onTap   : ()=> launchURL(context, scans[i]),
      
        ),
      )
    );
  }
}