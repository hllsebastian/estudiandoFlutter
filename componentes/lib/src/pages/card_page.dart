
import 'package:flutter/material.dart';


class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20), // margen
        children: <Widget>[
          _cardTipo1(),
          SizedBox( height: 25,), // Espacio entre tarjetas
          _cardtipo2(),
          SizedBox( height: 25,),
          _cardTipo1(),
          SizedBox( height: 25,), // Espacio entre tarjetas
          _cardtipo2(),
          SizedBox( height: 25,),
          _cardTipo1(),
          SizedBox( height: 25,), // Espacio entre tarjetas
          _cardtipo2(),
          SizedBox( height: 25,),
          _cardTipo1(),
          SizedBox( height: 25,), // Espacio entre tarjetas
          _cardtipo2(),
          SizedBox( height: 25,),
          _cardTipo1(),
          SizedBox( height: 25,), // Espacio entre tarjetas
          _cardtipo2(),
          SizedBox( height: 25,),
        ]
      ),
    );
  }

  // Aca se creo el contenido de la card
  Widget _cardTipo1() {
    
    return Card(
      elevation: 15, // Da efecto de sombra a la card
              // para darle forma redondeada a las esquinas
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.green),
            title: Text('Titulo de la tarjeta'),
            subtitle:Text('Desripcion larga de la tarjeta que estamos creando'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget> [
              TextButton(
                onPressed: () {}, 
                child: Text('Ok')
              ),
              TextButton(
                onPressed: () {}, 
                child: Text('Cancel')
              ),               
            ],
          ),
        ], 
      ),
    );
  }


  Widget _cardtipo2() {

    /// Para que la imagen cargada respete los bordes de la card se cambia el "return"
    /// por una variable tipo "final", para definir en el "return" como un "Container".
    /// 
    /// Luego de realizar la personalizacion en el "Container" que se retorna, la
    /// imagen cargada no adquiere la forma que se le da a los bordes en el "container",
    /// por lo que tambien el final se asignara como un "Container".
    /// Al final toda el tipo "Card" quedo como un "Container"
    /// 
  
    final card = Container(
      child: Column(
        children: <Widget>[
        // Widget usado para cargar una imagen y una animacion de espera
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'), 
            fadeInDuration: Duration(milliseconds: 400),
            image: NetworkImage ('https://s.walldump.com/wallpapers/walldump-D6DLZQv0d.jpg'),
            height: 250,
            fit: BoxFit.cover,
          ),
         /*  Image( // para cargar una imagen de la web
            image: NetworkImage('https://s.walldump.com/wallpapers/walldump-D6DLZQv0d.jpg'),
          ), */
          Container(
            padding: EdgeInsets.all(9),
            child: 
              Text('Pusimos una imagen de la web y luego excribios este texto'),
          ),
        ],
      ),
    ); 

    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(34),
        child: card,

      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        color: Colors.white, //se uso para ver las formas del borde
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            offset: Offset(2.0, 10),
            blurRadius: 10,
            spreadRadius: 2.0

          ),
        ],
      ),
    );
  }
}



