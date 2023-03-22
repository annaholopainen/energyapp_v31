import 'package:energyapp_v3/views/widgets/spotprice_box.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Color MyColor = Color(0xFFa3d0e8);

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: MyColor,
          image: DecorationImage(
            image: AssetImage('assets/BGShapes.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              child:Center(
                child: Text(
                  'Welcome user',
                   style: TextStyle(
                     fontFamily: 'Didact Gothic',
                     fontSize: 30.0,
                     color: Colors.white,
                   ),
                )
              ),
            ),
          SpotPriceCard(spotprice: '123', date: '22/03/2023'),
            Spacer(),
            BottomNavigationBar(
              backgroundColor: MyColor,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.indigo,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.auto_graph_sharp),
                  label: 'Graphs',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

