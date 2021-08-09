import 'package:flutter/material.dart';


class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // TODO: cambiar luego por una instancia de movie

                                            // para leer los argumentos  
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movies';
    

    return Scaffold(
      body: CustomScrollView( // crea efectos que se preprogaman usando "slivers"
        slivers: [
          _CustomAppBar(),
          SliverList( //Para agregar widgets que den  contenido, pero estos deben
            //ser tipo Sliver, por eso se usa la "SliverList"
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
            
            ]), 

          )     
        ],
      ),
    );
  }
}


class _CustomAppBar extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SliverAppBar( // no deja estrechar cuando se hace el scroll
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
     
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true, 
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text(
            'Movie.title',
            style: TextStyle(fontSize: 16),  
          )
        ),
        
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/300x500'),
          fit: BoxFit.cover, // para que expanda la imagen todo lo que pueda
        ),
      ),
    );
  }
}



class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),

          SizedBox(width: 20,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('movie.tittle', style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2),
              Text('movie.originalTitle', style: textTheme.subtitle1, overflow: TextOverflow.ellipsis),

              Row(
                children: [
                  Icon(Icons.star_outline, size: 15, color: Colors.red,),
                  SizedBox(width: 5),
                  Text('movie.voteAverage', style: Theme.of(context).textTheme.caption,),
                ],
              )

            ],
          ),
        ],

      ),
    );
  }
}


