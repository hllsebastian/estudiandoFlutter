import 'package:flutter/material.dart';
import 'package:movieapp/models/models.dart';
 

 
class MovieSlider extends StatefulWidget {
  
  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  const MovieSlider({
    Key? key, 
    required this.movies, 
    required this.onNextPage,
    this.title,
  }) : super(key: key);

  @override
  _MovieSliderState createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {


  final ScrollController scrollController = ScrollController();  

  @override // "initState" para ejecutar codigo la primera vez que el Widget
            // es construido
  void initState() { 
    super.initState();

    scrollController.addListener(() {

      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();

      }

    });
  }

  @override
  void dispose() { //"dispose" cuando el widget es destruido
    
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // para poner el texto al inicio
        
        children: [
        if(this.widget.title != null)
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(this.widget.title!, style: TextStyle(fontSize: 2, fontWeight: FontWeight.bold),),
          ),

          SizedBox(height: 5),

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal, // para poder desplazar horizontal
              itemCount: widget.movies.length,
              itemBuilder: (_, int index) => _MoviePoster(widget.movies[index]),

            ),
          ),
        ],
      ),    
    );
  }
}

class _MoviePoster  extends StatelessWidget {

  final Movie movie;
  const _MoviePoster(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [ 

          GestureDetector(
            onTap: () => Navigator.pushNamed( context, 'details', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 5),

          Text(
            movie.title,
            maxLines: 2, // para agregar nueva linea al texto
            overflow: TextOverflow.ellipsis, //para texto grande, agrega punstos
                                            //suspensivos
            textAlign: TextAlign.center,
          ),

        ],
      ),
    );
  }
}