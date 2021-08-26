import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/models/models.dart';
import 'package:productos_app/screens/screens.dart';

import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Para que dispare la info que se obtvo de la peticion HTTP
    final productsService = Provider.of<ProductsService>(context);
    
    // Mientras se esta cargando la peticion de producto, retornora el "LoadingScreen"
    if( productsService.isLoading ) return LoadingScreen();


    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),

      // El "ListView.builder" sera mas efeciente que un Listview, ya que crea
      // los widgets cuando se muestran en pantalla y no los mantiene activos
      // cuando estan fuera de esta 
      body: ListView.builder(
        itemCount: productsService.products.length, // Se pone la longitud
                          // de productos que se obtienen del servidor
                          // para que no saque error  

        // El "GestureDetector" permitira hacer tap en cualquier parte de la 
        // la tarjeta para redireccionarla a la ruta " 'product' " 
        itemBuilder: ( BuildContext context, int index ) => GestureDetector(
          onTap: () {
            
            // Aca se define que cuando se da tap al producto, se abrira en el
            // de edicion "ProductScreen", se hace con el ".copy" para romper 
            // la referencia y no afectar el listado de productos  
            productsService.selectedProduct = productsService.products[index].copy();
            Navigator.pushNamed(context, 'product'); // Donde se redirecciona
          },
          child: ProductCard(
            product: productsService.products[index], // se manda el indice 
                                                      // del producto 
          ),
        )
      ),

      // Boton para crear nuevo producto
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),
        onPressed: () {

          // El "productsService.selectedProduct " siempre debe estar
          // seleccionado 
          productsService.selectedProduct = new Product(
            available: false, 
            name: '', 
            price: 0
          );


          Navigator.pushNamed(context, 'product');
        },
      ),
   );
  }
}