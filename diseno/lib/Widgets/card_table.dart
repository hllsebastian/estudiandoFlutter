import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      // Funciona como una coleccion de rows

      children: [
        TableRow(children: [
          _SingleCard(
              color: Colors.blue, icon: Icons.border_all, text: 'general'),
          _SingleCard(
              color: Colors.pink, icon: Icons.bus_alert, text: 'transport'),
        ]),
        TableRow(children: [
          _SingleCard(
              color: Colors.blue, icon: Icons.border_all, text: 'general'),
          _SingleCard(
              color: Colors.pink, icon: Icons.bus_alert, text: 'transport'),
        ]),
        TableRow(children: [
          _SingleCard(
              color: Colors.blue, icon: Icons.border_all, text: 'general'),
          _SingleCard(
              color: Colors.pink, icon: Icons.bus_alert, text: 'transport'),
        ]),
        TableRow(children: [
          _SingleCard(
              color: Colors.blue, icon: Icons.border_all, text: 'general'),
          _SingleCard(
              color: Colors.pink, icon: Icons.bus_alert, text: 'transport'),
        ]),
        TableRow(children: [
          _SingleCard(
              color: Colors.blue, icon: Icons.border_all, text: 'general'),
          _SingleCard(
              color: Colors.pink, icon: Icons.bus_alert, text: 'transport'),
        ]),
        TableRow(children: [
          _SingleCard(
              color: Colors.blue, icon: Icons.border_all, text: 'general'),
          _SingleCard(
              color: Colors.pink, icon: Icons.bus_alert, text: 'transport'),
        ])
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard(
      {Key? key, required this.icon, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final column = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: this.color,
                  child: Icon(this.icon),
                  radius: 30,
                ),
                SizedBox(
                  height: 13,
                ),
                Text(this.text,
                    style: TextStyle(color: this.color, fontSize: 18))
              ],
            );

    return _CardBackground(child: column);
  }
}


class _CardBackground extends StatelessWidget {
  
  final Widget child;

  const _CardBackground({
    Key? key, 
    required this.child
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          // Para dar un efecto de desenfoque; este efecto consume mucha memoria
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),

          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              /* borderRadius: BorderRadius.circular(20) */
            ),
            child: this.child,
          ),
        ),
      ),
    );
  }
}
