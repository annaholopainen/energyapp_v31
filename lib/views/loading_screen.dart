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
          Center(
            child: LoadingAnimationWidget.inkDrop(
                color: Color(0xFF04669b),
                size: 70
        )
        ),
      ],
      ),
    );
  }
}