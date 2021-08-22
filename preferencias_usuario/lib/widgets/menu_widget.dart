import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/pages/home_page.dart';
import 'package:preferencias_usuario/src/pages/settings_page.dart';


class MenuWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Container(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/menu-img.jpg'),
                  fit: BoxFit.cover // para que expanda toda la imagen
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.pages, color: Colors.amber),
              title: Text('Home'),  
              onTap: (){
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.party_mode, color: Colors.amber),
              title: Text('Party Mode'),  
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.people, color: Colors.amber),
              title: Text('People'),  
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.amber),
              title: Text('Settings'),  
              onTap: (){
                Navigator.pop(context); //Hara que se cierre automaticamente
                            // el drawer, luego de ejecutada una accion sobre este     
                Navigator.pushNamed(context, SettingsPage.routeName);
              },
            )
          ],
        ),
      );
  }
}


