import 'package:flutter/material.dart';
import 'dart:async'; //Libreria para usar el "Timer"

class ListaPage extends StatefulWidget {
  ListaPage({Key? key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
//Aunque el "ListViewBuilder" funciona con elementos dinamicos,
// tambien puede usarse informacion por defecto
  // esta lista le indicara al
// "ListViewBuilder" cuantos y que elementos debe crear


  //Controlador del Scroll de la lista
  ScrollController _scrollController = ScrollController();
  
  List<int> _listaNum = [];
  int _ultimoItem = 0;

  bool _isLoading = false; // se cambiara cada que se llame el "fetchdata()"

  @override
  void initState() {
    super.initState(); // El super hace referencia a la clase State y
    // y la inicializa

    _agregar10();
  
    _scrollController.addListener(() {
      // Para que se dispare cada que se mueva el scroll.
      // el scroll tiene dos valores: 1-la posicion actual en pixeles
      // y 2-cual es el maximo de pixeles que tiene. Para este caso
      // se indica que cuando el scroll llegue a su maximo, llame al metodo
      // "_agregar10", es decir que cargara mas imagenes
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //_agregar10();
        fetchdata(); // Para hacer peticion HTTP
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: 
       _crearLista(),
    );
  }

  Widget _crearLista() {
    // Recordar que el "itemBuilder" es el metodo que se encarga
    //de redibujar los elementos que se encuentran dentro de
    //la lista, es decir, el "ListViewBuilder" redenriza los
    // elementos conforme se necesiten
    return ListView.builder(
      controller: _scrollController, //controla la posicion del scroll
      itemCount: _listaNum.length,       //para que cuente la posicion de la lista
      itemBuilder: (contex, index) {
        // para asignar el valor segun la posicion de la lista y asi
        //concatenar el valor en la ruta de donde cargaran las imagenes
        //de manera aleatoria
        final imagen = _listaNum[index];

        return FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 300),
          image: NetworkImage('https://picsum.photos/400/600/?image=$imagen'),
        );
      },
    );
  }

   _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNum.add(_ultimoItem);

      setState(() {});
    }
  }

  Future fetchdata() async{

      // 
    _isLoading = true;
    setState(() {});
      
      final duration = new Duration(seconds: 2);
      // cuando pasen los 2 segundos disparar el metodo "respuestaHTTP"
      return  Timer(duration, respuestaHTTP); 

  }

     respuestaHTTP(){  
      _isLoading = false;
      _agregar10();
    } 
  }

}
