import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/models/models.dart';
import 'package:productos_app/screens/screens.dart';

import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Acceso a la BD de los productos
    final productsService = Provider.of<ProductsService>(context);
    // Acceso al toquen. No necesita redibujarse "listen: false"
    final authService = Provider.of<AuthService>(context, listen: false);
    
    if( productsService.isLoading ) return LoadingScreen();


    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
        // actions: [], // para hacer un lista de widgets
        leading: IconButton( // boton para cerrar la sesion
          icon: Icon( Icons.login_outlined ),
          onPressed: () {

            authService.logout();
            // Para que al instante de presionar el boton, redireccione al
            // login, esto porque el "authService.logout()" es un future 
            Navigator.pushReplacementNamed(context, 'login');

          },
        ),
      ),
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder: ( BuildContext context, int index ) => GestureDetector(
          onTap: () {

            productsService.selectedProduct = productsService.products[index].copy();
            Navigator.pushNamed(context, 'product');
          },
          child: ProductCard(
            product: productsService.products[index],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),
        onPressed: () {

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