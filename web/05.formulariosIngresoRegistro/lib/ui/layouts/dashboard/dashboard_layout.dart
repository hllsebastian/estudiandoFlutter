import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {

  // Un layout requiere recibir un child, que es el que mostrara en alguna
  // parte del layout 
  final Widget child;

  const DashboardLayout({
    Key? key, 
    required this.child
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Dashboard', style: TextStyle( fontSize: 50 )),
            Expanded(child: child)
          ],
        ),
      ),
    );
  }
}