import 'package:flutter/material.dart';


// Icono de notificaciones

class NotificationsIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Icon( Icons.notifications_none_outlined, color: Colors.grey ),
          Positioned(
            left: 2,
            child: Container(
              width: 5,
              height: 5,
              decoration: buildBoxDecoration(),
            ),
          )
        ],
      ),
    );
  }

  // Aca se definio el punto rojo que indica cuando hay notificaciones sin leer
  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.circular(100)
  );
}