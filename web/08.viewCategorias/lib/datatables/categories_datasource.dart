import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/categories_provider.dart';

import 'package:admin_dashboard/models/category.dart';

import 'package:admin_dashboard/ui/modals/category_modal.dart';


// Aca se define el "source", parametro del "PaginatedDataTable" definido en la vista de
// categoria  

class CategoriesDTS extends DataTableSource {

  final List<Categoria> categorias; // Se define este parametro para tomar el listado
                                    // generado del get en la api y mostrarlo en patanlla
  final BuildContext context;

  CategoriesDTS(this.categorias, this.context);


  // "index" es cada una de las interacciones para el momento de graficar una fila
  @override
  DataRow getRow(int index) {

    final categoria = this.categorias[index]; // Con esta variable tenemos acceso a toda 
                                              // categoria
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell( Text( categoria.id ) ),
        DataCell( Text( categoria.nombre ) ),
        DataCell( Text( categoria.usuario.nombre ) ),
        DataCell( 
          Row(
            children: [
              IconButton(
                icon: Icon( Icons.edit_outlined ),
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context, 
                      builder: ( _ ) => CategoryModal( categoria: categoria )
                  );
                }
              ),
              IconButton(
                icon: Icon( Icons.delete_outline, color: Colors.red.withOpacity(0.8)),
                onPressed: () {
                  
                  final dialog = AlertDialog(
                    title: Text('¿Está seguro de borrarlo?'),
                    content: Text('¿Borrar definitivamente ${ categoria.nombre }?'),
                    actions: [
                      TextButton(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Si, borrar'),
                        onPressed: () async {
                          await Provider.of<CategoriesProvider>(context, listen: false)
                            .deleteCategory(categoria.id);

                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );

                  showDialog(
                    context: context, 
                    builder: ( _ ) => dialog 
                  );


                }
              ),
            ],
          )
        ),
      ]
    );
  }

  // Para contar el numero exacto (false) o aproximado (true), del rowCount
  @override
  bool get isRowCountApproximate => false;

  // Para contar cuantos elementos tiene el DataTable
  // la cantidad se definio por el numero de categorias recibidas de la API
  @override
  int get rowCount => categorias.length; 

  @override

  int get selectedRowCount => 0;

}