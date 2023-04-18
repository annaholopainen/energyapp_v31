import 'package:flutter/material.dart';
import 'package:energyapp_v3/models/colors/LightBlue.dart';

class ProfilePage extends StatelessWidget {
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
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(

                  )
                ],
              )
          )
        ],
      ),
    );
  }
}