import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';


// Construyendo la vista del dashboard

class DashboardView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(), // Para evitar el rebote
        children: [
          Text('Dashboard View', style: CustomLabels.h1 ),

          SizedBox( height: 10 ),

          WhiteCard(
            title: 'Sales Statistics',
            child: Text('Hola Mundo')
          )

        ],
      ),
    );
  }
}