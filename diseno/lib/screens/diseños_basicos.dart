import 'package:flutter/material.dart';
 
 
class BasicDesignScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           // Imagen
          Image(image: AssetImage('assets/hormiga.jpg')),
            
          // Titulo 
          Title(),
          
          // Button section
          ButtonSection(),

          // Description
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Sunt consectetur culpa ullamco minim pariatur esse irure sunt consequat incididunt non nostrud. Laboris non dolor adipisicing aliquip est esse anim. Voluptate aliqua officia nostrud nostrud minim nostrud. Irure voluptate adipisicing dolor non.'))

        ],
      ),
    );
  }
}


class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( // recomendable atrapar en un Container para personalizar diseño

      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row (children: [
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.start, //para alinear de forma horizontal en la Column
          children: [
            Text('Hormiga en telescopio de barrido', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Nombre científico: Formicidae', style: TextStyle(color: Colors.brown)),
          ],
        ),

        Expanded(child: Container()), // en este caso ayudo a expandir los Widget, para ocupar todo el
                            //espacio disponible

        Icon(Icons.star, color: Colors.red),
        Text('60')

      ],),
    );
  }
}


class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 60),
      child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            CustomButton(icon: Icons.call, text: 'Call',),
            CustomButton(icon: Icons.map_sharp, text: 'Route',),
            CustomButton(icon: Icons.share, text: 'Share',),
          ],

        ),
      );
  }
}


class CustomButton extends StatelessWidget {

  final IconData icon;
  final String   text;

  const CustomButton({
    Key? key, 
    required this.icon, 
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(this.icon, color: Colors.green, size: 35,),
        Text(this.text, style: TextStyle(color: Colors.green))
      ],
    );
  }
}
