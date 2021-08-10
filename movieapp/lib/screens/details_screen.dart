import 'package:flutter/material.dart';
import 'package:movieapp/models/models.dart';
import 'package:movieapp/widgets/casting_cards.dart';


class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // TODO: cambiar luego por una instancia de movie

                                            // para leer los argumentos  
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    
    return Scaffold(
      body: CustomScrollView( // crea efectos que se preprogaman usando "slivers"
        slivers: [
          _CustomAppBar(movie),
          SliverList( //Para agregar widgets que den  contenido, pero estos deben
            //ser tipo Sliver, por eso se usa la "SliverList"
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie),
              _OverView(movie),
              _OverView(movie),
              _OverView(movie),

              CastingCards(0),
            ]), 

          )     
        ],
      ),
    );
  }
}


class _CustomAppBar extends StatelessWidget {
  

  final Movie movie;

  const _CustomAppBar(this.movie);

   

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
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          color: Colors.black12,
          child: Text(
            movie.title,
            style: TextStyle(fontSize: 16),  
            textAlign: TextAlign.center,
          )
        ),
        
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullPosterImg),
          fit: BoxFit.cover, // para que expanda la imagen todo lo que pueda
        ),
      ),
    );
  }
}



class _PosterAndTitle extends StatelessWidget {

  final Movie movie;

  const _PosterAndTitle(this.movie);


  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage(movie.fullPosterImg),
              height: 150,
              width: 110,
            ),
          ),

          SizedBox(width: 20,),


          ConstrainedBox(  
            constraints: BoxConstraints(maxWidth: size.width - 190),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
                Text(movie.title, style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2),
                Text(movie.originalTitle, style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 2),
          
                Row(
                  children: [
                    Icon(Icons.star_outline, size: 15, color: Colors.red,),
                    SizedBox(width: 5),
                    Text('${movie.voteAverage}', style: Theme.of(context).textTheme.caption,),
                  ],
                )
              ],
            ),
          ),
        ],

      ),
    );
  }
}


class _OverView extends StatelessWidget {

  final Movie movie;

  const _OverView(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        '${movie.overview}',        
        textAlign: TextAlign.justify,    
        style    : Theme.of(context).textTheme.subtitle2,
      ),
    );
  }
}


