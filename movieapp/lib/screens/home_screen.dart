import 'package:flutter/material.dart';

import 'package:movieapp/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {}, 
          )
        ],
      ),

      body: Column(
        children: [
          CardSwiper(),

         //Listado horizontal de peliculas

        ],
      ),
  );
  }
}