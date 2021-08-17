import 'dart:io';

import 'package:path/path.dart';
import "package:sqflite/sqflite.dart";
import 'package:path_provider/path_provider.dart';

import 'package:qr_reader/models/scan_models.dart';

// Todo esta clase es la estructura de un singleton

class DBProvider {
  // En esta propiedad quedara la BD instanciada
  static Database? _database;

  // Esta sera la instancia de la BD. El "._" es para definir un
  //constructor privado
  static final DBProvider db = DBProvider._();
  // Cada vez que se haga un new DBProvider, siempre se tendra la
  //misma intancia de la BD

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();

    return _database!;
  }

  // Aca se esta creando la BD
  Future<Database> initDB() async {
    // 1. El path donde se almacena la BD. El "Directory" viene del
    // paquete Dart:IO, el "getApplicationDocumentsDirectory()" es
    // del paquete path_provider
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    // El "join()" permitira unir partes de variables para construir
    // la URL donde esta la BD. el ".db" es importante porque es la
    // del SQFLite
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    // 2. Creancion de la BD
    // La version debe cambiarse ascendentemente cada vez que se  haga
    // un cambio estructural en la BD, si no no ejecutara la rutina de
    // creacion de las tablas
    return await openDatabase(path,
        version: 1,
        onOpen: (db) {}, // Con la BD abierta y se quiere ejecutar algo

        // para crear la BD
        onCreate: (Database db, int version) async {
      await db.execute(''' 
              CREATE TABLE Scans(
                id INTEGER PRIMARY KEY,
                tipo TEXT,
                valor TEXT
              )  
          ''');
    });
  }

  /*  nuevoScanRaw(ScanModel nuevoScan) async {
    //Forma larga de ingresar un registro

    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    // verificar la BD
    final db = await database;

    final resp = await db.rawInsert('''

      INSERT INTO Scans(id, tipo, valor)
        VALUES($id, '$tipo', '$valor')    
    
    ''');

    return resp;
  }
 */

  // forma corta de ingresar datos
  nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());
    print(res);

    // "res" es el id del ultimo registro insertado
    return res;
  }

  // Para leer un valor
  Future getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  // Para leer todos los valores
  Future getTodosLosScans(int id) async {
    final db = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  // Para leer por tipo
  Future<List<ScanModel>> getScansPorTipo(String tipo) async {
    final db = await database;
    final res = await db.rawQuery('''

      SELECT * FROM scans WHERE tipo = $tipo    
    ''');

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  // Para actualizar raw
  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.update('Scans', nuevoScan.toJson(),
        where: 'id = ?', whereArgs: [nuevoScan.id]);
    return res;
  }

  // Para borrar un raw
  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  // para borrar toda la BD
  Future<int> deleteAllScans() async {
    final db = await database;


    // final res = await db.delete('Scans');// forma corta
    //Forma larga
    final res = await db.rawDelete('''
      DELETE FROM Scans
    ''');
    return res;
  }
}
