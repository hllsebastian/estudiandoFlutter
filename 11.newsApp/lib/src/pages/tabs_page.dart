import 'package:flutter/material.dart';
import 'package:newsapp/src/pages/tab1_page.dart';
import 'package:newsapp/src/pages/tab2_page.dart';
import 'package:provider/provider.dart';



class TabsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Aca creamos la instancia del "ChangeNotifierProvider", con el "create" 
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
   ),
    );
  }
}

class _Navegacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);


    return BottomNavigationBar( // Deben definirse al menos dos "items"

      currentIndex: navegacionModel.paginaActual, // Se define en cual
          // pagina hacer la navegacion, ES DECIR, esta escuchando cual es el
          // valor de la pagina actual  
      onTap: (i) => navegacionModel.paginaActual = i, // Aca se esta cambiando
                        // el valor de la pagina 
      items: [
        BottomNavigationBarItem( icon: Icon( Icons.person_outline ), title: Text('Para ti') ),
        BottomNavigationBarItem( icon: Icon( Icons.public ), title: Text('Encabezados') ),
      ]
    );
  }
}


// El que mostrara las paginas
class _Paginas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Aca se usara el modelo creado para instanciar por medio del Provider
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      // Controla la navegacion de una pagina a otra cuando se da tap
      controller: navegacionModel.pageController,

      // physics: BouncingScrollPhysics(),  // --> Da efecto al movimiento de page
      // cuando llega al limite.

      // Con el "NeverScrollableScrollPhysics", se bloquea el scroll para que el
      // movimiento de una pagina a otras se haga con la navegacion de botones,
      // es decir con el tap (BottomNavigationBarItem), con la ayuda de Provider
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[

        Tab1Page(),

        Tab2Page()

      ],
    );
  }
}


// "ChangeNotifier", ayudara  a notificar a los widgets que tienen "valor", si
// hubo un cambio sobre este. 
// Su funcion en general es noticar el cambio de una propiedad a todos los
// widgets que esten usando dicha propiedad  
class _NavegacionModel with ChangeNotifier{

  // Se define la propiedad para que la pagina actual sea la del boton en 
  // primera posicion
  int _paginaActual = 0;

  // Se define la propiedad para controlar el cambio de paginas 
  PageController _pageController = new PageController();


  int get paginaActual => this._paginaActual;

  set paginaActual( int valor ) {
    this._paginaActual = valor;

    // Se define su redibujo con una animacion
    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeOut );

    notifyListeners(); // Con esta funcion notificamos a los widgets (listeners)
            // que tienen referenciada la instancia y la propiedad del Provider 
  }


  PageController get pageController => this._pageController;

}