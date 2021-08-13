import 'package:flutter/material.dart';
  
import 'package:diseno/Widgets/background.dart';
import 'package:diseno/Widgets/card_table.dart';
import 'package:diseno/Widgets/custom_botton.dart';
import 'package:diseno/Widgets/page_title.dart';


  class HomeScreen extends StatelessWidget {
  
    @override
    Widget build(BuildContext context) {
      return Scaffold( 
        body: Stack( // para poner widgets encima de otros
          children: [

            // Background -> se hara en otro archivo, para evitar tanto codigo
            // en este archivo (orden)
            Background(),

            // Home Body
            _HomeBody()
          ]
       ),

        bottomNavigationBar: CustomBottomNavigation()

     );
    }
  }

class _HomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Si el hijo es mas grande que todas las 
                          //dimensiones me va a permitir hacer scroll

      child: Column(

        children: [

          // titulos
          PageTitle(),
          // card table
          CardTable()

        ],

      ),
    );




  }
}