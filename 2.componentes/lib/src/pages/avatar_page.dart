import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),

        actions: [// lista de widgets
          
           Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar( // se hizo "CircleAvatar, se le agrego imagen de la web"
              backgroundImage: NetworkImage('https://media.tenor.com/images/050a16f4c6b22e8693a69bea9876bd68/tenor.png'),
              radius: 25.0,
            ),
          ), 

          Container(
            margin: EdgeInsets.only(right: 5.0),
            child: CircleAvatar( //"CircleAvatar " solo con texto
              child: Text('MR'),
              backgroundColor: Colors.yellow,
            ),
          ),
        ], 
      ),
      body: Center(
         child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 300),        
          image: NetworkImage('https://cdn.atomix.vg/wp-content/uploads/2020/05/New-Project-26-1.jpg'),
        ), 
      ),
    );
  }
}


