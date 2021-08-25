import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductFormProvider extends ChangeNotifier {

  // La forma para mantener la referencia para usar el "isValidForm"
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  // Aca se establecio la instancia del "ProductFormProvider", para mostrarlo
  // en el screen 
  Product product;

  // IMPORTANTE que este producto sea una copia para no hacer modificaciones
  // elemento original del arreglo (mapa de productos) 
  ProductFormProvider( this.product );

  // Metodo para que el switch de disponible cambie si el producto esta
  // disponible y notifique a los listeners 
  updateAvailability( bool value ) {
    print(value);
    this.product.available = value;
    notifyListeners();
  }


  bool isValidForm() {

    print( product.name );
    print( product.price );
    print( product.available );

    return formKey.currentState?.validate() ?? false;
  }

}