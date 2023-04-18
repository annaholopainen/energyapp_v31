import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Color MyColor = Color(0xFFa3d0e8);

class LoadingScreen extends StatelessWidget {
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
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Text(
              "Welcome",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: LoadingAnimationWidget.inkDrop(
              color: Color(0xFF04669b),
              size: 70,
            ),
          ),
        ],
      ),
    );
  }
}