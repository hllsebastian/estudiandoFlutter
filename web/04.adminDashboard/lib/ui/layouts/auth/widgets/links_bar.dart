import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

// Creacion de una lista de texto que son un link

class LinksBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.black,
      // Condicion que permite mostrar todos los LinkText; si es inferior a 
      // a 1000px, se adaptara al "Wrap"; si no se hace esto no se muestran
      // todos los LinkText
      height: (size.width > 1000 ) ? size.height * 0.07 : null,
      // Los "LinkText" fueron creados por nosotros 
      child: Wrap(
        alignment: WrapAlignment.center, // Para centrar los "LinkText"
        children: [
          LinkText( text: 'About', onPressed: () => print('about') ),
          LinkText( text: 'Help Center' ),
          LinkText( text: 'Terms of Service' ),
          LinkText( text: 'Privacy Policy' ),
          LinkText( text: 'Cookie Policy' ),
          LinkText( text: 'Ads info' ),
          LinkText( text: 'Blog' ),
          LinkText( text: 'Status' ),
          LinkText( text: 'Careers' ),
          LinkText( text: 'Brand Resources' ),
          LinkText( text: 'Advertising' ),
          LinkText( text: 'Marketing' ),
        ],
      )
    );
  }
}