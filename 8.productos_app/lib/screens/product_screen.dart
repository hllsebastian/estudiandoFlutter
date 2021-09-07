import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';
import 'package:productos_app/providers/product_form_provider.dart';

import 'package:productos_app/services/services.dart';

import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';


class ProductScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    // Para que este widget pueda acceder al "ProductService"
    final productService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
      create: ( _ ) => ProductFormProvider( productService.selectedProduct ),
      // Para conectar la camara con el servidor
      child: _ProductScreenBody(productService: productService),
    );
  }
}

// Para crear acceso a la camara y esta pueda usar el ChangeNotifier
class _ProductScreenBody extends StatelessWidget {


  final ProductsService productService;
  
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    

   // Para dar acceso  al servidor al boton de guardardo y al formulario 
    final productForm = Provider.of<ProductFormProvider>(context);

    return Scaffold(
      
      // "SingleChildScrollView"  para ocultar el teclado cuando se da tap
      // en cualquier lugar de la pantalla fuera del teclado.  
      // "SingleChildScrollView" para que el teclado no tape los campos de
      
      // entrada del texto cuando se haga scroll 
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [


            // 1. El "Stack para crear widgets uno sobre otro".
            //    Se crea un el widget "product_image" en la carpeta de
            //    widgets. 

            Stack(
              children: [
                ProductImage( url: productService.selectedProduct.picture ),
                
                // 2. Creacion del boton para regresar
                Positioned(
                  top : 60,
                  left: 20,
                  // "IconButton" para hacer un boton que ejecute una
                  // instruccion cuando se presione y se le agregar icono  
                  child: IconButton( 
                    // ".pop", para regresar a la pantalla anterior
                    onPressed: () => Navigator.of(context).pop(), 
                    icon     : Icon( Icons.arrow_back_ios_new, size: 40, color: Colors.white ),
                  )
                ),

                // 3. Creacion boton para activar la camara
                // para acceder a la camara y a la galeraia se importa el 
                // package:image_picker, de la dependencia "image_picker" 
                Positioned(
                  top  : 60,
                  right: 20,
                  child: IconButton(
                    onPressed: () async {
                      
                      // Se crea la instancia de "ImagePicker"
                      final picker = new ImagePicker();

                      final PickedFile? pickedFile = await picker.getImage(
                        //source: ImageSource.gallery,
                        source      : ImageSource.camera,
                        imageQuality: 100 // Para darle mas calidad a la fotografia
                      );

                      if( pickedFile == null ) {
                        print('No seleccionó nada');
                        return;
                      }

                      // "pickedFile.path" es el path fisico de la imagen
                      // dentro del dispositivo 
                      productService.updateSelectedProductImage(pickedFile.path);
                      

                    }, 
                    icon: Icon( Icons.camera_alt_outlined, size: 40, color: Colors.white ),
                  )
                )
              ],
            ),

            // 4. Container extraido al widget "_ProductForm" 
            _ProductForm(),

            // Para poder hacer scroll con el input que se tiene en esta area
            SizedBox( height: 100 ),

          ],
        ),
      ),


      // 5. Icono para guardar el producto 
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        // Condicion para establecer que boton debe aparecer mientras
        // esta salvando y mientras no lo esta
        child: productService.isSaving 
          ? CircularProgressIndicator( color: Colors.white )
          : Icon( Icons.save_outlined ),
        onPressed: 
          // Si se esta guardando, no se puede hacer tap en el boton,
          // cuando no esta salvando se puede hacer tap 
          productService.isSaving 
          ? null
          : () async {
          
          // Si el formulario no es valido se hace return (no continua)
          if ( !productForm.isValidForm() ) return;

          // Para cargar nueva imagen
          final String? imageUrl = await productService.uploadImage();

          if ( imageUrl != null ) productForm.product.picture = imageUrl;

          // Si el formulario es valido guarda los cambio en el servidor
          // con el metodo "saveOrCreateProduct" 
          await productService.saveOrCreateProduct(productForm.product);

        },
      ),
   );
  }
}

// Haciendo el formulario con un campo para ingresar informacion del
// producto y otro para ingresar info del valor  (paso 4)
class _ProductForm extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    // Se integra el productForm con el Provider, para redibujar los cambios
    // en pantalla   
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product; // para simplificar el uso de la
                                        // variable "productForm" 

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10 ),
      child  : Container(
        // "paddign" para que los inputs no queden pegados al borde
        padding: EdgeInsets.symmetric(horizontal: 20),
        width  : double.infinity,
        decoration: _buildBoxDecoration(), //Para personializar el "Container"
        child     : Form( // Creando el formulario
          key             : productForm.formKey,
          // Hace validacion del formulario despues de la interaccion del usuario
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child           : Column(
            children: [

              SizedBox( height: 10 ),

              //Campo de entrada para el nombre del producto
              TextFormField(
                // Para ingresar al form el nombre traido del servidor  
                initialValue: product.name, 
                // Acá se recibe el cambio que el usuario haga en el form
                onChanged   : ( value ) => product.name = value, 
                // Condicion para controlar el ingreso de un nombre en el form
                validator   : ( value ) {
                  if ( value == null || value.length < 1 )
                    return 'El nombre es obligatorio'; 
                },
                decoration : InputDecorations.authInputDecoration(
                  hintText : 'Nombre del producto', 
                  labelText: 'Nombre:'
                ),
              ),

              SizedBox( height: 30 ),

              //Campo de entrada para el precio del producto
              TextFormField(
                 // Para ingresar al form el precio traido del servidor 
                initialValue   : '${product.price}',
                
                // El "inputFormatters" servira para dar reglas al form o a
                // su valor  
                inputFormatters: [   
                  // eso es una expresion regular que indica se debe escribir
                  // una cantidad de numeros, el punto y dos decimales. Se
                  // importa con el paquete services.dart 
                  FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                // Acá se recibe el cambio que el usuario haga en el form, se
                // condiciona porque el campo recibe Strings, la validacion esta
                // implicita aca   
                onChanged: ( value ) {
                  if ( double.tryParse(value) == null ) {
                    product.price = 0;
                  } else {
                    product.price = double.parse(value);
                  }
                },
                keyboardType: TextInputType.number, // Para que abra teclado numerico
                decoration  : InputDecorations.authInputDecoration(
                  hintText : '\$150', 
                  labelText: 'Precio:'
                ),
              ),
              
              SizedBox( height: 30 ),
              SwitchListTile.adaptive(
                value      : product.available, // Trae el valor del servidor
                title      : Text('Disponible'),
                activeColor: Colors.indigo,
                onChanged  : productForm.updateAvailability // Aca se llamo la
                                  // fucion que permite cambiar el switch de
                                  // disponibilidad del producto y notificar el
                                  // cambio a los listeners 
                                  //   
              ),


              SizedBox( height: 30 )

              // RECORDAR : el objetivo de los "SizedBox" es que se pueda
              // tener un campo suficiente para que al hacer scroll el teclado
              // no choque con los campos de entrada y asi se fluido el ingreso
              // de datos para el usuario 

            ],
          ),
        ),
      ),
    );
  }

  // Aca se personalizo el Container del "ProductForm"
  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color       : Colors.white,
    borderRadius: BorderRadius.only( bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
    boxShadow   : [
      BoxShadow(
        color     : Colors.black.withOpacity(0.05),
        offset    : Offset(0,5),
        blurRadius: 5
      )
    ]
  );
}