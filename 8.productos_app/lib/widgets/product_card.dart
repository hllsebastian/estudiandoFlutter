import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductCard extends StatelessWidget {


  // Para terminar de construir la tarjeta: se adiciona el contenido de la
  // imagen  
  final Product product;

  const ProductCard({
    Key? key, 
    required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      //Se le dio forma a las tarjetas donde se mostraran las imagenes
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only( top: 30, bottom: 50 ),
        width: double.infinity,
        height: 400,
        // 1. Aca se hicieron los bordes de la tarjeta
        decoration: _cardBorders(), 

        // 2. El "Stack" para poner widgets sobre otros: el contenido de la
        // tarjeta 
        child: Stack(  
          alignment: Alignment.bottomLeft,
          children: [

            // para el paso 3 y 4, se creo un container y luego se extrajo
            // en un widget

            // 3. Widget donde se definio la imagen que mostrara la tarjeta 
            _BackgroundImage( product.picture ),

            // 4. Detalles de la tarjeta en el borde inferior izquierdo
            _ProductDetails(
              title: product.name,
              subTitle: product.id!,
            ),

            // 5. Etiqueta del producto. Un container se extrajo en el
            // widget "_PriceTag", que luego fue envuelto en el "Positioned",
            // de esta forma se puede ubicar en la esquina superior derecho
            Positioned(
              top: 0,
              right: 0, // DERECHO
              child: _PriceTag( product.price )
            ),


            // 6. Disponiblidad del producto en el borde   superior izquierdo
            if( !product.available )
              Positioned(
                top: 0,
                left: 0, // IZQUIERDO
                child: _NotAvailable()
              ),

          ],
        ),
      ),
    );
  }

  // Se definio los bordes de la tarjeta (paso 3)
  BoxDecoration _cardBorders() => BoxDecoration( 
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(0,7),
        blurRadius: 10
      )
    ]
  );
}

class _NotAvailable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox( // Para definir como se adapta el widget interno
        fit: BoxFit.contain,
        child: Padding(// Para que el texto no quede pegado a los bordes
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'No disponible',
            style: TextStyle( color: Colors.white, fontSize: 20 ),
          ),
        ),
      ),
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.yellow[800],
        borderRadius: BorderRadius.only( topLeft: Radius.circular(25), bottomRight: Radius.circular(25) )
      ),
    );
  }
}

// creando el detalle en el borde superior derecho (paso 5)
class _PriceTag extends StatelessWidget {


  // Para obtener el precio del producto y mostrarlo en pantalla
  final double price;

  const _PriceTag( this.price );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox( // Para definir como se adapta el widget interno
        fit: BoxFit.contain, 
        child: Padding( // Para que el texto no quede pegado a los bordes
          padding: EdgeInsets.symmetric(horizontal: 10 ),
          child: Text('\$$price', style: TextStyle( color: Colors.white, fontSize: 20 ))
        ),
      ),
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only( topRight: Radius.circular(25), bottomLeft: Radius.circular(25) )
      ),
    );
  }
}

// Se definen los detalles de la tarjeta (paso 4)
class _ProductDetails extends StatelessWidget {

  // Para obtener el nombre del producto y mostrarlo en pantalla
  final String title;
  final String subTitle;

  const _ProductDetails({ 
    required this.title, 
    required this.subTitle
  });


  @override
  Widget build(BuildContext context) {

    return Padding(
      // Para hacerle una separacion con respecto al "_CardBorders"
      padding: EdgeInsets.only( right: 50 ),
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
        width: double.infinity,
        height: 70,
        // Personalizacion del widget en otro widget para que el
        // codigo quede mas ordenado 
        decoration: _buildBoxDecoration(), 
        child: Column( // Porque son dos textos.
          // "mainAxisAlignment" en la Column es verticual 
          // "crossAxisAlignment" en la Column es horizontal
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title, 
              style: TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // Por si el texto se sale
            ),
            Text(
              subTitle, 
              style: TextStyle( fontSize: 15, color: Colors.white ),
            ),
          ],
        ),
      ),
    );
  }

  // Personalizacion del detalle dentro de la tarjeta
  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.indigo,
    borderRadius: BorderRadius.only( bottomLeft: Radius.circular(25), topRight: Radius.circular(25) )
  );
}


// Widget donde se definio la imagen que mostrara la tarjeta (paso 2)
class _BackgroundImage extends StatelessWidget {
 
  // Aca se esta definiendo mostrar la imagen por URL y no por producto
  final String? url;

  const _BackgroundImage( this.url );

  @override
  Widget build(BuildContext context) {
    return ClipRRect( // Para darle el efecto redondeado a los bordes de la
                      // IMAGEN, la del area ya se hizo en "_cardBorders"
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        // Aca se establece una condicion para que muestre una imagen predeterminada
        // si el producto llamado desde el servidor no tiene imagen, de lo 
        // contrario muestra la imagen
        child: url == null
          ? Image(
              image: AssetImage('assets/no-image.png'),
              fit: BoxFit.cover
          )
          // Imagen de carga mientras aparece la imagen del contenido
          : FadeInImage( 
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(url!),
            fit: BoxFit.cover, // Para que la imagen se expanda en todo 
                              // el espacio disponible         
          ),
      ),
    );
  }
}