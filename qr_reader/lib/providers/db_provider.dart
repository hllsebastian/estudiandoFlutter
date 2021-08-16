import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import "package:sqflite/sqflite.dart";

// Todo esta clase es la estructura de un singleton

class DBProvider {
  // En esta propiedad quedara la BD instanciada
  static Database? _database;

  // Esta sera la instancia de la BD. El "._" es para definir un
  //constructor privado
  static final DBProvider db = DBProvider._();
  // Cada vez que se haga un new DBProvider, siempre se tendra la
  //misma intancia de la BD
  DBProvider._(); get database async {
    
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
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
    // La version debe cambiarse ascendentemente cada vez que se haga
    // un cambio estructural en la BD, si no no ejecutara la rutina de 
    // creacion
    return await openDatabase(
      
      path,
      version: 1,
      // onOpen:   () {}, // Con la BD abierta y se quiere ejecutar algo
      onCreate: (Database db, int version) async{ // para crear la BD

        await db.execute(''' 
        
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT,
          )  
        ''');

      } 

    );




  }
}
