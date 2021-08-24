import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_models.dart';
import 'package:qr_reader/providers/db_provider.dart';

// Va a servir para actualizar la UI
class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future nuevoScan(String valor) async {
    // Aca se esta creando la instancia, pero no inserta en la BD
    final nuevoScan = new ScanModel(valor: valor);
    // aca se esta insertando. El "nuevoScan" esta regresado el
    // "id" del registro insertado.
    final id = await DBProvider.db.nuevoScanRaw(nuevoScan);
    // Asignando el "id" de la BD al modelo
    nuevoScan.id = id;
    // para insertarlo en el listado "scans" y notificar a los
    // widgets que necesites ser redibujados
    if (this.tipoSeleccionado == nuevoScan.tipo) {
      this.scans.add(nuevoScan);
      notifyListeners();
    }

    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getTodosLosScans();
    this.scans = [...scans];
    notifyListeners();
  }

  cargarScanPorTipo(String tipo) async {
    final scans = await DBProvider.db.getScansPorTipo(tipo);
    this.scans = [...scans];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
    await DBProvider.db.deleteScan(id);
  }
}
