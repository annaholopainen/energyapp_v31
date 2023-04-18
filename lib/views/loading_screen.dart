import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:energyapp_v3/models/colors/LightBlue.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightBlue,
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