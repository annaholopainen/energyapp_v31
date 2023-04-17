import 'package:energyapp_v3/views/test.dart';
import 'package:flutter/material.dart';
import 'package:energyapp_v3/views/login_screen.dart';

import 'loading_screen.dart';

Color MyColor = Color(0xFFa3d0e8);

void main() {
  runApp(
    MaterialApp(
      home: HomePage()
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/BGShapes.png",
            fit: BoxFit.cover,
          ),
        ]
      )
    );
  }
}