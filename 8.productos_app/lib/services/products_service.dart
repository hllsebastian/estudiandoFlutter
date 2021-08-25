import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:http/http.dart' as http;

// "ProductServices" se hacen las peticiones HTTP. Se extiende con  
// "ChangeNotifier"  porque se usara el gestor de estado Notifier


class ProductsService extends ChangeNotifier {

  // Es el URL donde se hacen las llamadas
  final String _baseUrl = 'udemyflutterproductos-default-rtdb.firebaseio.com';
  // Los productos que se tienen en el "productService"
  // tipo final porque solo se cambiaran sus valores internos
  final List<Product> products = [];

  // Cuando se selecciona un producto. Se debe tener PRESENTE que los 
  // cambios realizados solo deberian cambiar el listado de los productos
  // cuando se de tap en el boton de guardar  
  late Product selectedProduct;

  File? newPictureFile;

  // Propiedad que mostrara cuando se carga y cuando no
  bool isLoading = true; 
  // Variable para usar en el metodo "saveOrCreateProduct"
  bool isSaving = false;

  // Cuando la instancia de "ProductsServices" es llamada se disparara un 
  // metodo de cargar productos. Se llamara al constructor
  ProductsService() {
    this.loadProducts();
  }

  // Metodo que  se dispara cuando se llama la instancia "ProductsServices"
  //
  // Por medio de la extension de asistencia pubspec, se añadio la dependecia
  // http para poder hacer las peticiones 
  Future<List<Product>> loadProducts() async {

    this.isLoading = true; // cuando esta cargando esta en true
    notifyListeners(); // y se le notifica a los listeners 
    
    // URL que se esta llamando (importando) = breakpoint
    final url = Uri.https( _baseUrl, 'productos.json');
    
    // Aca se empieza a utilizar la URL... 
    final resp = await http.get( url );
    
    // para converti el Json en un Map...
    final Map<String, dynamic> productsMap = json.decode( resp.body );
    
    // Para facilitar el scrol en la pantalla con las informacion recibida
    // de la peticion, se convierte el map a List:
     
    productsMap.forEach((key, value) { // Se barre el mapa
      final tempProduct = Product.fromMap( value );
      tempProduct.id = key;
      this.products.add( tempProduct ); // Se agrega el valor a la lista
    });

    // Cuando termina la peticion y convierte los datos
    this.isLoading = false;
    notifyListeners();

    return this.products;

  }


  // Meotodo para crear o actualizar 
  Future saveOrCreateProduct( Product product ) async {

    isSaving = true;
    notifyListeners();

    if ( product.id == null ) {
      // Es necesario crear
      await this.createProduct( product );
    } else {
      // Actualizar
      await this.updateProduct( product );
    }



    isSaving = false;
    notifyListeners();

  }
  

  Future<String> updateProduct( Product product ) async {

    // Aca se hace la peticion al backend, se accede al endopoint del id del
    // producto 
    final url = Uri.https( _baseUrl, 'productos/${ product.id }.json');
    // Se envia como ".put" para actualizar y se envia como Json ".toJson" 
    final resp = await http.put( url, body: product.toJson() );
    final decodedData = resp.body;

    //Actualizar el listado de productos por el ID
    // se busca el ID del producto (como mapa)  y luego de obtenido se puede
    // actualizar. Asi todo el objeto cambia   
    final index = this.products.indexWhere((element) => element.id == product.id );
    this.products[index] = product;

    return product.id!;

  }

  Future<String> createProduct( Product product ) async {

    final url = Uri.https( _baseUrl, 'products.json');
    final resp = await http.post( url, body: product.toJson() );
    final decodedData = json.decode( resp.body );

    product.id = decodedData['name'];

    this.products.add(product);
    

    return product.id!;

  }
  

  void updateSelectedProductImage( String path ) {

    this.selectedProduct.picture = path;
    this.newPictureFile = File.fromUri( Uri(path: path) );

    notifyListeners();

  }

  Future<String?> uploadImage() async {

    if (  this.newPictureFile == null ) return null;

    this.isSaving = true;
    notifyListeners();

    final url = Uri.parse('https://api.cloudinary.com/v1_1/dx0pryfzn/image/upload?upload_preset=autwc6pa');

    final imageUploadRequest = http.MultipartRequest('POST', url );

    final file = await http.MultipartFile.fromPath('file', newPictureFile!.path );

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if ( resp.statusCode != 200 && resp.statusCode != 201 ) {
      print('algo salio mal');
      print( resp.body );
      return null;
    }

    this.newPictureFile = null;

    final decodedData = json.decode( resp.body );
    return decodedData['secure_url'];

  }

}