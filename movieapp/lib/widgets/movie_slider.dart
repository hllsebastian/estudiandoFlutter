import 'package:flutter/material.dart';
 

 
class MovieSlider extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // para poner el texto al inicio
        
        children: [
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('Populares'),
          ),

          SizedBox(height: 5),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // para poder desplazar horizontal
              itemCount: 20,
              itemBuilder: (_, int index) => _MoviePoster(),

            ),
          ),
        ],
      ),    
    );
  }
}

class _MoviePoster  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [ 

          GestureDetector(
            onTap: () => Navigator.pushNamed( context, 'details', arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage('https://via.placeholder.com/300x400'),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 5),

          Text(
            'Blue november: Aca va un titulo, si es muy grande se',
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